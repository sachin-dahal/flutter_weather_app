import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/screens/weather_page.dart';
import 'package:flutter_weather_app/utility/bloc/weather_bloc.dart';
import 'package:flutter_weather_app/utility/bloc/weather_event.dart';
import 'package:flutter_weather_app/utility/bloc/weather_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    TextEditingController _cityController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              child: FlareActor("assets/WorldSpin.flr",
                  fit: BoxFit.cover, animation: "roll"),
            ),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherIsNotSearched) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Search Weather",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Instantly",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "City name",
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.white54,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ButtonTheme(
                        minWidth: double.infinity,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () => weatherBloc.add(
                            FetchWeatherEvent(_cityController.text),
                          ),
                          child: Text(
                            "Search",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is WeatherIsLoading) {
                return Center(
                  child: CupertinoActivityIndicator(radius: 25.0),
                );
              } else if (state is WeatherIsLoaded) {
                return WeatherPage(state.weatherModel, _cityController.text);
              }
              return Center(
                child: Text("Error Occured!"),
              );
            },
          ),
        ],
      ),
    );
  }
}
