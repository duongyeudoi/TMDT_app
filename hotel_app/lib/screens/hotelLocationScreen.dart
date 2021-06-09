import 'package:flutter/material.dart';
import 'package:hotel_app/models/hotel_model.dart';

class HotelLocationScreen extends StatefulWidget {
  Hotel hotel;
  @override
  _HotelLocationScreenState createState() => _HotelLocationScreenState();
}

class _HotelLocationScreenState extends State<HotelLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vị trí',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
