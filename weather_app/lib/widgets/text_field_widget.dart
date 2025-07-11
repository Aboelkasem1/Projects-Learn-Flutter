import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/test.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (value) async {
              Provider.of<CityName>(context, listen: false).SearchCity(value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text(
                'Search',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              hintText: 'Enter a City',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.pink),
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cansle',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                ),
              ),
              SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
