import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:hotel_app/screens/eventsScreen.dart';
import 'package:hotel_app/screens/favouriteScreen.dart';
import 'package:hotel_app/screens/mainHomeScreen.dart';
import 'package:hotel_app/screens/nearbyScreen.dart';
import 'package:hotel_app/screens/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String idScreen = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bottomTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  int _currentTab = 0;

  final Tabs = [
    MainHomeScreen(),
    NearbyScreen(),
    FavouriteScreen(),
    EventScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFFB7B7B7),
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
            title: Text(
              'Trang chủ',
              style: bottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.room,
              size: 30.0,
            ),
            title: Text(
              'Gần đây',
              style: bottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                size: 40.0,
              ),
              title: Text(
                'Yêu thích',
                style: bottomTextStyle,
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.takeout_dining,
              size: 30.0,
            ),
            title: Text(
              'Khuyến mãi',
              style: bottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 30.0,
            ),
            title: Text(
              'Cá nhân',
              style: bottomTextStyle,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
