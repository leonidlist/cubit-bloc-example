import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/model/weather.dart';
import 'package:bloc_tutorial/data/weatherRepository.dart';
import 'package:bloc_tutorial/exceptions/network_exception.dart';
import 'package:flutter/semantics.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError('Cannot load weather...'));
    }
  }
}
