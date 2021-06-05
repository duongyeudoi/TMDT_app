import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import './widgets/progressDialog.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import './screens/homeScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './models/hotel_model.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

void registerNewUser(BuildContext context, String name, String email,
    String phone, String password) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(
          message: "Đang đăng ký, vui lòng chờ...",
        );
      });

  final response = await http.post(
    Uri.parse("http://13.213.73.64:5000/user_register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user': email.trim(),
      'password': generateMd5(password.trim()),
    }),
  );

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: 'Đăng ký thành công');
    Navigator.pushNamed(context, HomeScreen.idScreen);
  } else {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Đăng ký không thành công");
  }
  return;
}

void loginAuth(BuildContext context, String email, String password) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(
          message: "Đang xác thực, vui lòng chờ...",
        );
      });
  email = email.trim();
  String hashdedPassword = generateMd5(password.trim());
  String uri =
      'http://13.213.73.64:5000/user_validate?user="$email"&password="$hashdedPassword"';
  final response = await http.get(Uri.parse(uri));
  Map<String, dynamic> resBody = jsonDecode(response.body);

  if (resBody["result"] == "true") {
    Navigator.pushNamed(context, HomeScreen.idScreen);
    Fluttertoast.showToast(msg: 'Đăng nhập thành công');
  } else {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Không thể đăng nhập");
  }
  return;
}

Future<List<Hotel>> getHotelsByDestination(String destination) async {
  final response = await http.get(
      Uri.parse('http://13.213.73.64:5000/hotel_info?district=$destination'));
  List temp = jsonDecode(response.body);
  List<Hotel> hotels = [];
  for (int i = 0; i < temp.length; i++) {
    Hotel receivedHotel = Hotel(
      address: temp[i]["address"],
      imageUrl: temp[i]["image"],
      name: temp[i]["name"],
      longitude: double.parse(temp[i]["longitude"]),
      latitude: temp[i]["latitude"],
      overnightprice: temp[i]["price"],
      twohourprice: temp[i]["price2hours"],
      rating: temp[i]["rating"],
      introduction:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.In porta euismod neque, vel sagittis augue suscipit et. In sapien ipsum, vehicula sit amet ante non, sollicitudin venenatis est.Vivamus imperdiet venenatis tellus eget fringilla.',
    );
    hotels.add(receivedHotel);
  }

  if (hotels == null) return temp_hotels;

  return hotels;
}
