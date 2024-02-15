import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationData();

    print("--------------------------");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationData: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitDoubleBounce(
      size: 100,
      color: Colors.white,
    ));
  }
}
