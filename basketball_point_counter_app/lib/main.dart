import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int teamAScore = 0;

  int teamBScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Counter App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoSlab",
            ),
          ),
        ),
        
        body: Column(
          
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Team A',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$teamAScore',
                      style: TextStyle(
                        fontSize: 130,
                        
                        color: Colors.black,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,        
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),                        
                          elevation: 20,
                          minimumSize: Size(70, 50),
                        ),
                        onPressed: (){
                          setState(() {
                            teamAScore += 1;
                          });
                        }, 
                        child: Text(
                          "Add 1 Point",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),                
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),    
                          
                          elevation: 20,
                          minimumSize: Size(70, 50),
                                             
                        ),
                        onPressed: (){
                          setState(() {
                            teamAScore += 2;
                          });
                        }, 
                        child: Text(
                          "Add 2 Point",  
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),                        
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,                      
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 20,
                          minimumSize: Size(70, 50),
                      
                        ),
                        onPressed: (){
                          setState(() {
                            teamAScore += 3;
                          });
                        }, 
                        child: Text(
                          "Add 3 Point", 
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),                       
                        ),
                      ),
                    ),
                    
                  ],
                ),               

                SizedBox(
                  height: 400,
                  
                  child: VerticalDivider(
                    color: Colors.blueGrey,
                    thickness: 1,                    
                    width: 10,                    
                    radius: BorderRadius.circular(10),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Team B',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$teamBScore',
                      style: TextStyle(
                        fontSize: 130,
                        
                        color: Colors.black,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,                   
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),                        
                          elevation: 20,
                          minimumSize: Size(50, 50),
                        ),
                        onPressed: (){
                          setState(() {
                            teamBScore += 1;
                          });
                        }, 
                        child: Text(
                          "Add 1 Point",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),                
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,                
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),    
                          
                          elevation: 20,
                          minimumSize: Size(50, 50),
                                             
                        ),
                        onPressed: (){
                          setState(() {
                            teamBScore += 2;
                          });
                        }, 
                        child: Text(
                          "Add 2 Point",  
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),                        
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,             
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 20,
                          minimumSize: Size(50, 50),
                      
                        ),
                        onPressed: (){
                          setState(() {
                            teamBScore += 3;
                          });
                        }, 
                        child: Text(
                          "Add 3 Point", 
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),                       
                        ),
                      ),
                    ),
                    
                  ],
                ),               
              
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,             
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                  minimumSize: Size(150, 50),
              
                ),
                onPressed: (){
                  setState(() {
                    teamAScore = 0;
                    teamBScore = 0;
                  });
                }, 
                child: Text(
                  "Reset Score", 
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),                       
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
