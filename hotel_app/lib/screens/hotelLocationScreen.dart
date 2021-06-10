import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_app/models/hotel_model.dart';
import 'package:wemapgl/wemapgl.dart';
import '../api_controller.dart';

class HotelLocationScreen extends StatefulWidget {
  HotelLocationScreen({this.hotel});
  Hotel hotel;
  @override
  _HotelLocationScreenState createState() => _HotelLocationScreenState();
}

class _HotelLocationScreenState extends State<HotelLocationScreen> {

  WeMapDirections directionAPI = WeMapDirections();

  int _tripDistance = 0;

  WeMapController mapController;

  @override
  void _onMapCreated(WeMapController mapController) {
    this.mapController = mapController;
  }

  double dp(double val, int places){
    return num.parse(val.toStringAsFixed(places));
  }

  void onStyleLoadedCallback() async {
    List<LatLng> points = [];

    points.add(LatLng(currentLocation.latitude, currentLocation.longitude)); //origin Point
    //TODO reverse lat long after QuangHuy edit database
    points.add(LatLng(widget.hotel.longitude,widget.hotel.latitude));


    final json = await directionAPI.getResponseMultiRoute(1, points); //0 = car, 1 = bike, 2 = foot
    List<LatLng> _route = directionAPI.getRoute(json);
    List<LatLng> _waypoins = directionAPI.getWayPoints(json);

    setState(() {
      _tripDistance = directionAPI.getDistance(json) ;
    });

    await mapController.addLine(
      LineOptions(
        geometry: _route,
        lineColor: "#0071bc",
        lineWidth: 5.0,
        lineOpacity: 1,
      ),
    );
    await mapController.addCircle(
        CircleOptions(geometry: _waypoins[0], circleRadius: 8.0, circleColor: "#0b12e0", circleStrokeWidth: 1.5, circleStrokeColor: '#ffffff'));
    for (int i = 1; i < _waypoins.length; i++) {
      await mapController.addCircle(
          CircleOptions(geometry: _waypoins[i], circleRadius: 8.0, circleColor: "#db0d33", circleStrokeWidth: 1.5, circleStrokeColor: '#ffffff'));
    }
  }



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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              "Khoảng cách: $_tripDistance m",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 150,
              child: WeMap(
                onMapCreated: _onMapCreated,
                onStyleLoadedCallback: onStyleLoadedCallback,
                initialCameraPosition: CameraPosition(
                  target: LatLng(currentLocation.latitude, currentLocation.longitude),
                  zoom: 13,
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
