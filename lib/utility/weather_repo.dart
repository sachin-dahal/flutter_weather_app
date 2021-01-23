import 'package:dio/dio.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherRepo {
  final dioClient = Dio();
  final url = "http://api.openweathermap.org/data/2.5/weather";

  Future<WeatherModel> getWeatherModel(String cityName) async {
    try {
      final result = await dioClient.get(url +
          "?q=$cityName&appid=4283dbbbef485370df831fdd08734659&units=metric");
      var parsedData = WeatherModel.fromJson(result.data['main']);
      return parsedData;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
