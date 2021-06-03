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
                colors: [Colors.blue, Colors.lightBlue]
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
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Cuong", // Lấy API đi 
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "pacman@gmail.com", // Lấy API đi 
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )
                    /*SizedBox(
                      height: 10.0,
                    ),*/
                    /*Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Posts",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "5200",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "28.5K",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "1300",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )*/
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
