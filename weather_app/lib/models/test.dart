import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class CityName extends ChangeNotifier {
  WeatherModel? _weatherModel;
  WeatherModel? get weatherModel => _weatherModel;

  void SearchCity(String value) async {
    _weatherModel = await WeatherService(Dio()).getCurrentWeather(value);
    notifyListeners();
  }

}
