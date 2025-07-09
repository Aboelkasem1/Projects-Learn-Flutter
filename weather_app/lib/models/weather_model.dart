import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WeatherModel extends ChangeNotifier {
  String cityName = "Start";
  double temp = 0;
  String description = "";
  String icon = "sunny";

  String get getIcon => icon;
  String get getDescription => description;
  double get getTemp => temp;
  String get getCityName => cityName;

  final Dio dio = Dio(); // هنستخدم Dio هنا مباشرة

  Future<void> changeCity(String newCity) async {
    cityName = newCity;
    await fetchWeatherData(); // يجيب بيانات المدينة الجديدة
    notifyListeners();
  }

  Future<void> fetchWeatherData() async {
    const apiKey = '387a80d6e1dd4f0bdd264065e5f53833';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    try {
      final response = await dio.get(url);
      final data = response.data;

      temp = (data['main']['temp'] as num).toDouble();
      description = data['weather'][0]['description'];
      icon = data['weather'][0]['icon'];

      notifyListeners();
    } catch (e) {
      print('❌ Error fetching weather: $e');
    }
  }
}
