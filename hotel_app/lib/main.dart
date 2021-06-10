import 'package:flutter/material.dart';
import 'package:hotel_app/api_controller.dart';
import 'package:hotel_app/screens/loginScreen.dart';
import 'package:wemapgl/wemapgl.dart';
import './screens/homeScreen.dart';
import './screens/registerationScreen.dart';
import './models/destination_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getCurrentLocation();
  Configuration.setWeMapKey('GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ');
  loadDataOfDestinations();
  runApp(MyApp());
}


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
      initialRoute: LoginScreen.idScreen,
    );
  }
}
