import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 85, 116),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              child: CircleAvatar(
                radius: 98,
                backgroundImage: AssetImage("images/myPhoto1.jpg"),
                backgroundColor: Colors.white,
              ),
            ),
            Text(
              "Aboelkasem Elsayed",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "PermanentMarker",
              ),                
            ),
            Text(
              "I'm a Flutter developer",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 167, 212, 255),
                fontWeight: FontWeight.bold,
                fontFamily: "WDXLLubrifontSC",
              )
            ),
            Divider(
              color: Color.fromARGB(255, 167, 212, 255),
              thickness: 1,
              indent: 70,
              endIndent: 70,
              radius: BorderRadius.circular(999),
              height: 5,
            ),
            
            Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  Icons.phone, 
                  color: Color.fromARGB(255, 0, 85, 116),
                  size: 30,
                ),
                title: Text(
                  "+201030474997",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 0, 85, 116),
                    fontWeight: FontWeight.bold,
                    fontFamily: "WDXLLubrifontSC",
                  ),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  Icons.email, 
                  color: Color.fromARGB(255, 0, 85, 116),
                  size: 30,
                ),
                title: Text(
                  "aboelkasem8088@gmail.com",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 0, 85, 116),
                    fontWeight: FontWeight.bold,
                    fontFamily: "WDXLLubrifontSC",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
