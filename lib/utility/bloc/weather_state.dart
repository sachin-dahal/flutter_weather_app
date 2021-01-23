import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final _weatherModel;
  WeatherIsLoaded(this._weatherModel);
  WeatherModel get weatherModel => _weatherModel;

  @override
  List<Object> get props => [_weatherModel];
}

class WeatherIsNotLoaded extends WeatherState {}
