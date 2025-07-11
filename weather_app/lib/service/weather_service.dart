import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Dio dio;
  final String ApiKey = '387a80d6e1dd4f0bdd264065e5f53833';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather(String city) async {
    try {
      Response response = await dio.get(
        '$baseUrl/weather?q=$city&appid=$ApiKey&units=metric',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage =
          e.response!.data['error']['message'] ?? 'try later please';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
    
  }
}
