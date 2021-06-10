import 'package:flutter/material.dart';
import 'package:hotel_app/api_controller.dart';
import 'package:hotel_app/models/destination_model.dart';
import 'package:wemapgl/wemapgl.dart';

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {

  WeMapController mapController;

  void _addCircle(double lat, double long, String color) {
    mapController.addCircle(
      CircleOptions(
          geometry: LatLng(lat, long),
          circleRadius: 8.0,
          circleColor: color,
          circleStrokeWidth: 1.5,
          circleStrokeColor: '#ffffff',
          ),
    );
  }

  void _loadNearPoints() {
    _addCircle(currentLocation.latitude, currentLocation.longitude, "#0b12e0");

    for(int i = 0; i < destinations.length; i++)
      for(int j = 0; j < destinations[i].hotels.length; j++)
        _addCircle(destinations[i].hotels[j].latitude, destinations[i].hotels[j].longitude, "#db0d33");
  }

  void _onMapCreated(WeMapController controller) {
    this.mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gần đây',
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
      body: WeMap(
        onMapCreated: _onMapCreated,
        onStyleLoadedCallback: _loadNearPoints,
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 10.0,
        ),
      ),
    );
  }
}
