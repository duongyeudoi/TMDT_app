import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white]
              )
            ),

            child: Container(
              width: double.infinity,
              height: 250.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.orange,
                    ),

                    SizedBox (
                      height: 10.0,
                    ),

                    Text( // Lấy API đi 
                      "Cuong", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(
                      height: 5.0,
                    ),

                    Text(
                      "pacman@gmail.com", // Lấy API đi 
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            )
          ),

          SizedBox(
            height: 20.0,
          ),

          Container(
            width: 200.00,
          ),
        ],
      ),
    );
  }
}
