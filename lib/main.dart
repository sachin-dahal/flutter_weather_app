import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/screens/home_page.dart';
import 'package:flutter_weather_app/utility/bloc/weather_bloc.dart';
import 'package:flutter_weather_app/utility/bloc/weather_event.dart';
import 'package:flutter_weather_app/utility/bloc/weather_state.dart';
import 'package:flutter_weather_app/utility/weather_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
      ),
      home: BlocProvider(
          create: (BuildContext context) =>
              WeatherBloc(WeatherState(), WeatherRepo())
                ..add(ResetWeatherEvent()),
          child: HomePage()),
    );
  }
}
