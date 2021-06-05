import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/screens/loginScreen.dart';

import './screens/homeScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import './screens/registerationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child('users');

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0E52E1),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      routes: {
        registerationScreen.idScreen: (context) => registerationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        HomeScreen.idScreen: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.idScreen,
    );
  }
}
