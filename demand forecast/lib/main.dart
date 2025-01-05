import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agriculture Insights',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agriculture Insights'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          NavigationOptionsSection(),
        ],
      ),
      bottomNavigationBar: FooterSection(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Agriculture Insights',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            'Empowering Farmers with Data-Driven Decisions',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class NavigationOptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationButton(
            label: 'Real-Time Demand Forecasting',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RealTimeDemandForecastingSection()),
              );
            },
          ),
          NavigationButton(
            label: 'Crop Planning Recommendations',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CropPlanningRecommendationsSection()),
              );
            },
          ),
          NavigationButton(
            label: 'Profitability Estimations',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfitabilityEstimationsSection()),
              );
            },
          ),
          NavigationButton(
            label: 'Market Alerts',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MarketAlertsSection()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  NavigationButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class RealTimeDemandForecastingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Demand Forecasting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-Time Demand Forecasting',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 400,
              child: charts.BarChart(
                [
                  charts.Series<Map<String, dynamic>, String>(
                    id: 'Demand',
                    data: [
                      {'crop': 'Apple', 'value': 50},
                      {'crop': 'Banana', 'value': 60},
                      {'crop': 'Carrot', 'value': 45},
                      {'crop': 'Tomato', 'value': 55},
                      {'crop': 'Broccoli', 'value': 40},
                      {'crop': 'Grapes', 'value': 65},
                      {'crop': 'Sugarcane', 'value': 70},
                      {'crop': 'Potato', 'value': 80},
                      {'crop': 'Onion', 'value': 75},
                      {'crop': 'Garlic', 'value': 50},
                      {'crop': 'Spinach', 'value': 60},
                      {'crop': 'Cucumber', 'value': 45},
                      {'crop': 'Lettuce', 'value': 55},
                      {'crop': 'Pumpkin', 'value': 30},
                      {'crop': 'Beetroot', 'value': 40},
                      {'crop': 'Cauliflower', 'value': 35},
                      {'crop': 'Bell Pepper', 'value': 50},
                      {'crop': 'Cabbage', 'value': 45},
                      {'crop': 'Chilli', 'value': 55},
                      {'crop': 'Radish', 'value': 30},
                      {'crop': 'Mango', 'value': 70},
                      {'crop': 'Pineapple', 'value': 65},
                      {'crop': 'Strawberry', 'value': 75},
                      {'crop': 'Pear', 'value': 60},
                    ],
                    domainFn: (Map<String, dynamic> data, _) => data['crop'],
                    measureFn: (Map<String, dynamic> data, _) => data['value'],
                    colorFn: (_, __) =>
                        charts.MaterialPalette.teal.shadeDefault,
                  ),
                ],
                animate: true,
                vertical: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CropPlanningRecommendationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Planning Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.teal),
              headingTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              columns: [
                DataColumn(
                    label: Text('Crop',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Recommendation',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Planting Time',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Apple')),
                  DataCell(Text(
                      'Requires cool temperatures, plant in early spring')),
                  DataCell(Text('March - April')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Banana')),
                  DataCell(
                      Text('Thrives in tropical climates, plant year-round')),
                  DataCell(Text('Anytime')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Carrot')),
                  DataCell(Text('Requires loose soil, plant in early spring')),
                  DataCell(Text('March - April')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Tomato')),
                  DataCell(Text('Needs warm temperatures, plant after frost')),
                  DataCell(Text('April - May')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Broccoli')),
                  DataCell(Text(
                      'Requires cool weather, plant in early spring or fall')),
                  DataCell(Text('March - May, August - September')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Grapes')),
                  DataCell(
                      Text('Prefers sunny locations, plant in early spring')),
                  DataCell(Text('March - April')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Sugarcane')),
                  DataCell(Text(
                      'Requires tropical climate, plant during dry season')),
                  DataCell(Text('October - March')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfitabilityEstimationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profitability Estimations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.teal),
              headingTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              columns: [
                DataColumn(
                    label: Text('Crop',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Estimated Cost (INR)',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Estimated Profit (INR)',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Apple')),
                  DataCell(Text('₹1,200')),
                  DataCell(Text('₹3,000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Banana')),
                  DataCell(Text('₹1,000')),
                  DataCell(Text('₹2,500')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Carrot')),
                  DataCell(Text('₹600')),
                  DataCell(Text('₹1,800')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Tomato')),
                  DataCell(Text('₹800')),
                  DataCell(Text('₹2,000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Broccoli')),
                  DataCell(Text('₹1,000')),
                  DataCell(Text('₹2,200')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Grapes')),
                  DataCell(Text('₹2,000')),
                  DataCell(Text('₹4,000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Sugarcane')),
                  DataCell(Text('₹2,500')),
                  DataCell(Text('₹5,500')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MarketAlertsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Alerts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Market Alerts',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildAlertCard(
                    'Apple prices are expected to rise next week.',
                    'Alert: 01/09/2024',
                    Icons.arrow_upward,
                    Colors.red,
                  ),
                  _buildAlertCard(
                    'Banana market has stabilized with steady demand.',
                    'Alert: 02/09/2024',
                    Icons.arrow_downward,
                    Colors.green,
                  ),
                  _buildAlertCard(
                    'Broccoli prices drop due to oversupply.',
                    'Alert: 03/09/2024',
                    Icons.trending_down,
                    Colors.orange,
                  ),
                  _buildAlertCard(
                    'Pear prices expected to rise due to high demand.',
                    'Alert: 04/09/2024',
                    Icons.trending_up,
                    Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard(
      String title, String subtitle, IconData icon, Color color) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

const List<Map<String, String>> cropRecommendations = [
  {
    'Crop': 'Wheat',
    'Recommendation': 'Plant in winter',
    'Planting Time': 'November - December'
  },
  {
    'Crop': 'Rice',
    'Recommendation': 'Plant in rainy season',
    'Planting Time': 'June - July'
  },
  {
    'Crop': 'Corn',
    'Recommendation': 'Requires full sun',
    'Planting Time': 'March - April'
  },
  {
    'Crop': 'Soybean',
    'Recommendation': 'Plant in spring',
    'Planting Time': 'April - May'
  },
  // Add more recommendations as needed
];

const List<Map<String, String>> profitabilityEstimations = [
  {'Crop': 'Wheat', 'Cost': '₹20,000', 'Profit': '₹30,000'},
  {'Crop': 'Rice', 'Cost': '₹25,000', 'Profit': '₹35,000'},
  {'Crop': 'Corn', 'Cost': '₹15,000', 'Profit': '₹25,000'},
  {'Crop': 'Soybean', 'Cost': '₹18,000', 'Profit': '₹28,000'},
  // Add more estimations as needed
];

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '© 2024 Agriculture Insights. All rights reserved.',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
