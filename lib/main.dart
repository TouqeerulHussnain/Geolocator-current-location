import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:html';
import 'seconfScreen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentLocation = "";
  var Latitude = "";
  var Longitude = "";
  @override
  void getCurrentLocaion() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("permission denied");
        }
      }
    } catch (e) {
      getCurrentLocaion();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
    setState(() {
      Longitude = position.longitude.toString();
      Latitude = position.latitude.toString();
    });
  }

  void initState() {
    super.initState();
    getCurrentLocaion();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                getCurrentLocaion();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Get Location',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Latitude :  $Latitude",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Latitude :  $Longitude",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Next Screen',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
