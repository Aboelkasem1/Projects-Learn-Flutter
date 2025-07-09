// lib/services/weather_api_service.dart
import 'package:dio/dio.dart';

class WeatherApiService {
  final Dio dio = Dio();
  final String apiKey = '387a80d6e1dd4f0bdd264065e5f53833';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
