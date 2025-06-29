import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(ContentApp());
}

class ContentApp extends StatelessWidget {
  const ContentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.lightBlueAccent,
              width: Size.infinite.width,
              height: 370,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage(
                          "images/tom.jpg",
                        ),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Name Surname",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "MerriweatherSans",
                      ),
                    ),
                  ),

                  Text(
                    "title of the person",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "MerriweatherSans",
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              
              width: Size.infinite.width,
              height: 350,

              child: ListView(
                children: [
                  Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Card(
                      margin: EdgeInsets.only(bottom: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: ListTile(
                        
                        leading: Icon(
                          Icons.phone_android,
                          color: Colors.lightBlueAccent,
                          size: 40,
                        ),
                        title: Text(
                          "+1234567890",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        subtitle: Text("Mobile Number"),
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Card(
                      
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      child: ListTile(
                        
                        leading: Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                          size: 40,
                        ),
                        title: Text(
                          "Email@gmail.com",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )  
                        ),
                        subtitle: Text("Email Address"),
                      ),
                    ),
                  ),

                  Divider(
                    height: 0,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Card(
                      
                      margin: EdgeInsets.only(top: 0),
                      elevation: 1,
                      shadowColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ListTile(
                        
                        leading: Icon(
                          Icons.public,
                          color: Colors.lightBlueAccent,
                          size: 40,
                        ),
                        title: Text(
                          "https://www.linkedin.com",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )  
                        ),
                        subtitle: Text("Website Address"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
            
        ),
      ),
    );
  }
}
