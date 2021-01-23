import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/utility/bloc/weather_event.dart';
import 'package:flutter_weather_app/utility/bloc/weather_state.dart';
import 'package:flutter_weather_app/utility/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherIsNotSearched();

  WeatherRepo weatherRepo;

  WeatherBloc(WeatherState initialState, this.weatherRepo)
      : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherIsLoading();
      try {
        final result = await weatherRepo.getWeatherModel(event.cityName);
        yield WeatherIsLoaded(result);
      } catch (e) {
        yield WeatherIsNotLoaded();
      }
    } else if (event is ResetWeatherEvent) {
      yield WeatherIsNotSearched();
    }
  }
}
