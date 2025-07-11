import 'package:flutter/material.dart';

class NoWeatherUntilNowWidget extends StatelessWidget {
  const NoWeatherUntilNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No City', style: TextStyle(fontSize: 40)),
          SizedBox(height: 20),
          Text(
            'Please Search for a City',
            style: TextStyle(fontSize: 20),
          ),
        ],
      );
  }
}
