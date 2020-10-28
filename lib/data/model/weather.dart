import 'package:flutter/foundation.dart';

class Weather {
  final String cityName;
  final double temperatureCelsius;

  Weather({@required this.cityName, @required this.temperatureCelsius});

  @override
  bool operator ==(Object obj) {
    if(identical(this, obj))
      return true;

    return obj is Weather && obj.cityName == cityName && obj.temperatureCelsius == temperatureCelsius;
  }

  @override
  int get hasCode => cityName.hashCode ^ temperatureCelsius.hashCode;
}