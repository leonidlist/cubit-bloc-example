import 'package:bloc_tutorial/bloc/weather_bloc.dart';
import 'package:bloc_tutorial/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => _submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Enter a city',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void _submitCityName(BuildContext context, String cityName) {
    final weatherBloc = context.bloc<WeatherBloc>();
    weatherBloc.add(GetWeather(cityName));
  }
}