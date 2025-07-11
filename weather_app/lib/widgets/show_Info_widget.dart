import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/test.dart';
import 'package:weather_app/widgets/no_weather_until_now_widget.dart';

class ShowInfoWeatherWidget extends StatelessWidget {
  const ShowInfoWeatherWidget({super.key});

  String IconSrc({required String icon}) {
    if (icon.contains('01d') || icon.contains('01n')) {
      return 'assets/01d.json';
    } else if (icon.contains('02d') ||
        icon.contains('02n') ||
        icon.contains('03d') ||
        icon.contains('03n') ||
        icon.contains('04d') ||
        icon.contains('04n')) {
      return 'assets/02d.json';
    } else if (icon.contains('09d') ||
        icon.contains('09n') ||
        icon.contains('10d') ||
        icon.contains('10n')) {
      return 'assets/09d.json';
    } else if (icon.contains('11d') || icon.contains('11n')) {
      return 'assets/11d.json';
    } else if (icon.contains('13d') || icon.contains('13n')) {
      return 'assets/13d.json';
    } else {
      return 'assets/50d.json';
    }
  }

  String ImageSrc({required String icon}) {
    if (icon.contains('01d') || icon.contains('01n')) {
      return 'assets/backgrounds/01d.jpg';
    } else if (icon.contains('02d') ||
        icon.contains('02n') ||
        icon.contains('03d') ||
        icon.contains('03n') ||
        icon.contains('04d') ||
        icon.contains('04n')) {
      return 'assets/backgrounds/02d.jpg';
    } else if (icon.contains('09d') ||
        icon.contains('09n') ||
        icon.contains('10d') ||
        icon.contains('10n')) {
      return 'assets/backgrounds/09d.jpg';
    } else if (icon.contains('11d') || icon.contains('11n')) {
      return 'assets/backgrounds/11d.jpg';
    } else if (icon.contains('13d') || icon.contains('13n')) {
      return 'assets/backgrounds/13d.jpg';
    } else {
      return 'assets/backgrounds/50d.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CityName>(
        builder: (context, value, child) {
          return value.weatherModel !=
                  null // Users should search city to show weather info
              ? Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImageSrc(icon: value.weatherModel!.icon),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              value.weatherModel!.description,
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 3,
                            ),
                          ),
                          Spacer(flex: 4),
                          Lottie.asset(IconSrc(icon: value.weatherModel!.icon)),
                          Spacer(flex: 3),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 30),
                              Text(
                                value.weatherModel!.cityName,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${value.weatherModel!.temp.toString().substring(0, 2)}°',
                                style: TextStyle(
                                  fontSize: 100,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Hight: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${value.weatherModel!.maxTemp}°C',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Text(
                                        'Low: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${value.weatherModel!.minTemp.toString()}°C',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,)
                                ],
                              ),
                            ],
                          ),
                          
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'feel like: ${value.weatherModel!.feelsLike.toString().substring(0, 2)}°',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ),
                )
              : NoWeatherUntilNowWidget(); // If weatherModel == null, this means Users have not searched for a city until now
        },
      ),
    );
  }
}
