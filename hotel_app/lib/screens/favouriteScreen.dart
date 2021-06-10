import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/models/hotel_model.dart';
import 'package:hotel_app/screens/success.dart';
import 'package:hotel_app/widgets/overNightpicker.dart';
import 'package:hotel_app/widgets/twoHourspicker.dart';

enum Status { first, second, third, fourth }

var Hotels = [];

class FavouriteScreen extends StatefulWidget {
  final Hotel hotel;
  FavouriteScreen({this.hotel});
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Status _type = Status.first;
  int value = 0;
  final Labels = [
    'Thanh toán tại khách sạn',
    'Internet Banking (Thẻ ATM)',
    'Thẻ tín dụng',
    'Paypal',
  ];
  final LabelsIcon = [
    Icons.money_off,
    Icons.credit_card,
    Icons.payment,
    Icons.account_balance_wallet,
  ];



  int i = 0;

  String getPrice(int value) {
    if (value == 0) {
      return '\$${widget.hotel.twohourprice}';
    } else {
      return '\$${widget.hotel.overnightprice}';
    }
  }

  void initState() {
    super.initState();
  }

  final tabs = [
    twoHourspicker(),
    OverNightPicker(),
  ];

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
    );
  }
}