import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool on = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            setState(() {
              on = true;
            });
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  String typedCity = '';
                  return AlertDialog(
                    backgroundColor: const Color.fromARGB(167, 255, 255, 255),
                    title: const Text("Search City"),
                    content: TextField(
                      decoration: const InputDecoration(hintText: "Enter city"),
                      onChanged: (value) => typedCity = value,
                      onSubmitted: (value) async {
                        final weatherModel = Provider.of<WeatherModel>(
                          context,
                          listen: false,
                        );
                        weatherModel.changeCity(value);
                        Navigator.of(context).pop();
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          on = false;
                          final weatherModel = Provider.of<WeatherModel>(
                            context,
                            listen: false,
                          );
                          weatherModel.changeCity(typedCity);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Search"),
                      ),
                    ],
                  );
                },
              );
            },

            child: Container(
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 5),
                  const Text(
                    'Search City...',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: Colors.grey[400],
      ),
      body: Consumer<WeatherModel>(
        builder: (context, model, child) {
          return (model.cityName == 'Start' || on)
              ? const Center(child: Text('Search City'))
              : WeatherInfo(cityName: model.cityName);
        },
      ),
    );
  }
}
