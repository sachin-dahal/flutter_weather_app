import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

// http://api.openweathermap.org/data/2.5/weather?q=dharan&appid=4283dbbbef485370df831fdd08734659&units=metric
