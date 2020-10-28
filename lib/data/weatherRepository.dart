import 'dart:math';

import 'package:bloc_tutorial/data/model/weather.dart';
import 'package:bloc_tutorial/exceptions/network_exception.dart';

abstract class WeatherRepository {
  //Throws [NetworkException].
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        //Simulate network exception
        if(random.nextBool()) {
          throw NetworkException();
        }

        return Weather(
          cityName: cityName,
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      }
    );
  }
}