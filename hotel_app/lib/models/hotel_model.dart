class Hotel {
  String imageUrl;
  String name;
  String address;
  String introduction;
  int twohourprice;
  int overnightprice;
  int rating;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.introduction,
    this.twohourprice,
    this.overnightprice,
    this.rating,
  });
}

List<Hotel> hotels = [
  Hotel(
      imageUrl: 'assets/images/hotel0.jpg',
      name: 'KIM HOTEL',
      address:
          '12 ngõ 75 Cầu Đất, Chương Dương Độ, Hoàn Kiếm, Hà Nội, Việt Nam',
      twohourprice: 175,
      overnightprice: 300,
      rating: 5,
      introduction:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.In porta euismod neque, vel sagittis augue suscipit et. In sapien ipsum, vehicula sit amet ante non, sollicitudin venenatis est.Vivamus imperdiet venenatis tellus eget fringilla.'),
  Hotel(
      imageUrl: 'assets/images/hotel1.jpg',
      name: 'Hotel 1',
      address:
          '12 ngõ 75 Cầu Đất, Chương Dương Độ, Hoàn Kiếm, Hà Nội, Việt Nam',
      twohourprice: 300,
      overnightprice: 652,
      rating: 4,
      introduction:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.In porta euismod neque, vel sagittis augue suscipit et. In sapien ipsum, vehicula sit amet ante non, sollicitudin venenatis est.Vivamus imperdiet venenatis tellus eget fringilla.'),
  Hotel(
      imageUrl: 'assets/images/hotel2.jpg',
      name: 'Hotel 2',
      address:
          '12 ngõ 75 Cầu Đất, Chương Dương Độ, Hoàn Kiếm, Hà Nội, Việt Nam',
      twohourprice: 240,
      overnightprice: 480,
      rating: 4,
      introduction:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.In porta euismod neque, vel sagittis augue suscipit et. In sapien ipsum, vehicula sit amet ante non, sollicitudin venenatis est.Vivamus imperdiet venenatis tellus eget fringilla.'),
];
