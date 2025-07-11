class WeatherModel {
  final String cityName;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final double feelsLike;
  final String description;
  final String icon;

  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.feelsLike,
    required this.description,
    required this.icon,
  });


  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['name'],
      temp: json['main']['temp'],
      maxTemp: json['main']['temp_max'],
      minTemp: json['main']['temp_min'],
      feelsLike: json['main']['feels_like'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
