import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.only(right: 32, left: 32, top: 10),
          child: Column(
            children: <Widget>[
              Text(city,style: TextStyle(color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),

              Text("degree C",style: TextStyle(color: Colors.white70, fontSize: 50),),
              Text("Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      //Text(weather.getMinTemp.round().toString()+"C",style: TextStyle(color: Colors.white70, fontSize: 30),),
                      Text("Min Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      //Text(weather.getMaxTemp.round().toString()+"C",style: TextStyle(color: Colors.white70, fontSize: 30),),
                      Text("Max Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: (){
                  },
                  color: Colors.lightBlue,
                  child: Text("Search", style: TextStyle(color: Colors.white70, fontSize: 16),),

                ),
              )
            ],
          )
      );
  }
}