import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  FetchWeatherEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class ResetWeatherEvent extends WeatherEvent {}
