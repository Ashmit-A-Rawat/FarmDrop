import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey =
      'd45641e22cc9cd365a856cf70b76c045'; // Replace with your OpenWeatherMap API key
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String location) async {
    final url = '$baseUrl?q=$location&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
