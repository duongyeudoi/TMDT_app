import 'package:hotel_app/models/hotel_model.dart';
import 'hotel_model.dart';

import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Hotel> hotels;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.hotels,
  });
}

List<Hotel> dhotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'KIM HOTEL',
    address: '12 ngõ 75 Cầu Đất, Chương Dương Độ, Hoàn Kiếm, Hà Nội, Việt Nam',
    twohourprice: 175,
    overnightprice: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: '12 ngõ 75 Cầu Đất, Chương Dương Độ, Hoàn Kiếm, Hà Nội, Việt Nam',
    twohourprice: 300,
    overnightprice: 652,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '12 ngõ 75 Cầu Đất, Chương Dương Độ, Hoàn Kiếm, Hà Nội, Việt Nam',
    twohourprice: 240,
    overnightprice: 480,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: 'Hoàn Kiếm',
    country: 'Hà Nội',
    description: 'Visit Hoàn Kiếm for an amazing and unforgettable adventure.',
    hotels: hotels,
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Cầu Giấy',
    country: 'Hà Nội',
    description: 'Visit Cầu Giấy for an amazing and unforgettable adventure.',
    hotels: hotels,
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'Đống Đa',
    country: 'Hà Nội',
    description: 'Visit Đống Đa for an amazing and unforgettable adventure.',
    hotels: hotels,
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Nam Từ Liêm',
    country: 'Hà Nội',
    description: 'Visit Hà Nội for an amazing and unforgettable adventure.',
    hotels: hotels,
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'Hai Bà Trưng',
    country: 'Hà Nội',
    description: 'Visit Hà Nội for an amazing and unforgettable adventure.',
    hotels: hotels,
  ),
];
