import 'package:hotel_app/models/hotel_model.dart';
import 'hotel_model.dart';
import '../api_controller.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Hotel> hotels = [];

  Destination ( imageUrl, city, country, description) {
    this.imageUrl = imageUrl;
    this.city = city;
    this.country = country;
    this.description = description;
    getterHotels();
  }

  Future<void> getterHotels() async {
    this.hotels = await getHotelsByDestination(this.city);
  }

}

List<Destination> destinations = [];

void loadDataOfDestinations() {
    destinations = [
    Destination('assets/images/venice.jpg', 'Hoàn Kiếm', 'Hà Nội', 'Visit Hoàn Kiếm for an amazing and unforgettable adventure.'),
    Destination('assets/images/paris.jpg', 'Cầu Giấy', 'Hà Nội', 'Visit Cầu Giấy for an amazing and unforgettable adventure.'),
    Destination('assets/images/newdelhi.jpg', 'Đống Đa', 'Hà Nội', 'Visit Đống Đa for an amazing and unforgettable adventure.'),
    Destination('assets/images/saopaulo.jpg', 'Nam Từ Liêm', 'Hà Nội', 'Visit Hà Nội for an amazing and unforgettable adventure.'),
    Destination('assets/images/newyork.jpg', 'Hai Bà Trưng', 'Hà Nội', 'Visit Hà Nội for an amazing and unforgettable adventure.')
  ];
}
