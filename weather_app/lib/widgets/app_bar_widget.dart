import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Weather',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blueAccent,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
