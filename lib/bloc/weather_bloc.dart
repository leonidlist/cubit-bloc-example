import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/model/weather.dart';
import 'package:bloc_tutorial/data/weatherRepository.dart';
import 'package:bloc_tutorial/exceptions/network_exception.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is GetWeather) {
      try {
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkException {
        yield WeatherError('Cannot load weather...');
      }
    }
  }
}
