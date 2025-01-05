import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import for loading animations
import 'weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather and Pest Alerts',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: WeatherPestAlertsPage(),
    );
  }
}

class WeatherPestAlertsPage extends StatefulWidget {
  @override
  _WeatherPestAlertsPageState createState() => _WeatherPestAlertsPageState();
}

class _WeatherPestAlertsPageState extends State<WeatherPestAlertsPage>
    with TickerProviderStateMixin {
  final WeatherService weatherService = WeatherService();
  final TextEditingController _locationController = TextEditingController();
  String _weatherInfo = '';
  String _pestAlert = '';
  bool _loading = false;
  bool _showWeatherInfo = false;
  bool _showPestAlert = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  String _lastQueriedLocation = ''; // To track the last location queried

  // Animation Controller for button animation
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _buttonAnimation =
        Tween<double>(begin: 1.0, end: 32.0).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Curves.easeInOut,
    ));
  }

  void _getWeather() async {
    final location = _locationController.text.trim();

    // Check if the location is empty or the same as the last queried location
    if (location.isEmpty || location == _lastQueriedLocation) {
      return; // Do nothing if location is empty or already queried
    }

    setState(() {
      _loading = true;
      _weatherInfo = '';
      _pestAlert = '';
      _showWeatherInfo = false;
      _showPestAlert = false;
      _buttonController.forward(); // Start button animation
    });

    try {
      final weatherData = await weatherService.fetchWeather(location);
      setState(() {
        _weatherInfo = '''
Location: ${weatherData['name']}
Temperature: ${weatherData['main']['temp']} °C
Humidity: ${weatherData['main']['humidity']} %
Conditions: ${weatherData['weather'][0]['description']}
''';
        _pestAlert = _generatePestAlert();
        _showWeatherInfo = true;
        _showPestAlert = true;
      });
      _addAlertsToList();
      _lastQueriedLocation = location; // Update the last queried location
    } catch (error) {
      setState(() {
        _weatherInfo = 'Error: Unable to fetch weather data.';
        _showWeatherInfo = true;
      });
    } finally {
      setState(() {
        _loading = false;
        _buttonController.reverse(); // End button animation
      });
    }
  }

  String _generatePestAlert() {
    final pests = ['Aphids', 'Caterpillars', 'Mites'];
    final alert = pests[
        (pests.length * DateTime.now().millisecond / 1000).floor() %
            pests.length];
    return 'Alert: Potential outbreak of $alert based on current weather conditions.';
  }

  void _addAlertsToList() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (_weatherInfo.isNotEmpty) {
        _listKey.currentState?.insertItem(0);
      }
    });
    Future.delayed(Duration(milliseconds: 600), () {
      if (_pestAlert.isNotEmpty) {
        _listKey.currentState?.insertItem(1);
      }
    });
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localized Weather Forecast and Pest Alerts'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter Location',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.location_on),
              ),
              onChanged: (value) {
                // Reset alerts when the user changes the location
                setState(() {
                  _weatherInfo = '';
                  _pestAlert = '';
                  _lastQueriedLocation =
                      ''; // Clear last queried location when typing a new one
                  _listKey.currentState
                      ?.removeItem(0, (context, animation) => Container());
                  _listKey.currentState
                      ?.removeItem(1, (context, animation) => Container());
                });
              },
            ),
            SizedBox(height: 16),
            AnimatedBuilder(
              animation: _buttonController,
              builder: (context, child) => ElevatedButton(
                onPressed: _getWeather,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors
                      .blueGrey[800], // Changed button color to a darker shade
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        _buttonAnimation.value), // Animated border radius
                  ),
                ),
                child: _loading
                    ? SpinKitDoubleBounce(
                        color: Colors.white,
                        size: 24) // Using a loading spinner animation
                    : Text('Get Weather and Pest Alerts',
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                Colors.white)), // Ensured text color is white
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: 0,
                itemBuilder: (context, index, animation) {
                  return _buildAlertCard(index, animation);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard(int index, Animation<double> animation) {
    final content = index == 0 ? _weatherInfo : _pestAlert;
    final title = index == 0 ? 'Weather Information' : 'Pest Alert';
    final color = index == 0 ? Colors.blue[50] : Colors.red[50];
    final icon = index == 0 ? Icons.wb_sunny : Icons.warning;

    return ScaleTransition(
      scale: animation,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon,
                      color: index == 0 ? Colors.blueAccent : Colors.redAccent),
                  SizedBox(width: 8),
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(),
              Text(
                content,
                style: TextStyle(
                    fontSize: 16,
                    color: index == 0 ? Colors.blue[800] : Colors.red[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
