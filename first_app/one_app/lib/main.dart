import 'package:flutter/material.dart';

void main() {
  runApp(BarthDay());
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.brown.shade800,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.brown.shade700,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.brown.shade600,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.brown.shade500,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            Container(
              color: Colors.brown.shade400,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            Container(
              color: Colors.brown.shade300,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.brown.shade200,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.brown.shade100,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BarthDay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFD1BBD4),
        body: Image(
          image: AssetImage('images/image1.webp'),
        ),
      ) 
    );
    
  }
}