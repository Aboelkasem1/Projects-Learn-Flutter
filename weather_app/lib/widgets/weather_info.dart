import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.cityName});

  final String cityName;

  String getLottieIcon(String iconCode) {
    if (iconCode == '01d' || iconCode == '01n') {
      return 'assets/sunny.json';
    }

    if (iconCode == '02d' ||
        iconCode == '02n' ||
        iconCode == '03d' ||
        iconCode == '03n' ||
        iconCode == '04d' ||
        iconCode == '04n') {
      return 'assets/clouds.json';
    }
    if (iconCode == '09d' ||
        iconCode == '09n' ||
        iconCode == '10d' ||
        iconCode == '10n') {
      return 'assets/rainy.json';
    } else if (iconCode == '11d' || iconCode == '11n') {
      return 'assets/thunder.json';
    } else if (iconCode == '13d' || iconCode == '13n') {
      return 'assets/13d.json';
    } else if (iconCode == '50d' || iconCode == '50n') {
      return 'assets/50d.json';
    } else {
      return 'assets/sunny.json';
    }
  }

  String getBackground(String iconCode) {
    if (iconCode == '01d' || iconCode == '01n') {
      return 'assets/backgrounds/01d.jpg';
    } else if (iconCode == '02d' || iconCode == '02n') {
      return 'assets/backgrounds/02d.jpg';
    } else if (iconCode == '03d' ||
        iconCode == '03n' ||
        iconCode == '04d' ||
        iconCode == '04n') {
      return 'assets/backgrounds/04d.jpg';
    } else if (iconCode == '09d' ||
        iconCode == '09n' ||
        iconCode == '10d' ||
        iconCode == '10n') {
      return 'assets/backgrounds/09d.jpg';
    } else if (iconCode == '11d' || iconCode == '11n') {
      return 'assets/backgrounds/11d.jpg';
    } else if (iconCode == '13d' || iconCode == '13n') {
      return 'assets/backgrounds/13d.jpg';
    } else if (iconCode == '50d' || iconCode == '50n') {
      return 'assets/backgrounds/50d.jpg';
    } else {
      return 'assets/backgrounds/01d.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<WeatherModel>(context);

    String icon = getLottieIcon(value.icon);
    Color? colortxt = (value.icon == '11d' || value.icon == '11n')
        ? Colors.white
        : Colors.black;

    return Stack(
      children: [
        SizedBox.expand(
          child: Opacity(
            opacity: 0.895,
            child: Image.asset(getBackground(value.icon), fit: BoxFit.cover),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 40, color: colortxt),
                        Text(
                          value.getCityName[0].toUpperCase() +
                              value.getCityName.substring(1),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: colortxt,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.5,
                            decorationColor: colortxt,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    boxShadow: [
                      BoxShadow(
                        color: (value.icon == '50d' || value.icon == '50n')
                            ? Colors.grey.withOpacity(0.3)
                            : Colors.transparent,
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(child: Lottie.asset(icon)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  value.getDescription,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colortxt,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "${value.getTemp.toStringAsFixed(1)} °C",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colortxt,
                  ),
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ],
    );
  }
}
