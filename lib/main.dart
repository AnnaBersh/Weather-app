import 'package:flutter/material.dart';
import 'package:weather_project/screens/location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
