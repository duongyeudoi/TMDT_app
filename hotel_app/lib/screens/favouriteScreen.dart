import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/models/hotel_model.dart';
import 'package:hotel_app/screens/hotelDetails.dart';
import 'package:hotel_app/screens/success.dart';
import 'package:hotel_app/widgets/overNightpicker.dart';
import 'package:hotel_app/widgets/twoHourspicker.dart';
import '../api_controller.dart';

class FavouriteScreen extends StatefulWidget {
  final Hotel hotel;
  FavouriteScreen({this.hotel});
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavouriteHotels();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách yêu thích',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Image.asset('assets/images/bookme.png'),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: favoriteHotels.length,
        itemBuilder: (BuildContext context, int index) {
          Hotel hotel = favoriteHotels[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HotelDetail(hotel: hotel),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(hotel.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    bottom: 5.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HotelDetail(hotel: hotel),
                          ),
                        );
                      },
                      child: Text('Xem ngay'),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: Text(
                      hotel.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
