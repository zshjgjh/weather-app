import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('Search City'),
    backgroundColor: Colors.blue,),
    body:   Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Center(
        child: TextField(
          onSubmitted: (value){
            BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value); //trigger cubit
            Navigator.of(context).pop;
          },

          decoration: const InputDecoration(labelText: 'Search',
          suffixIcon: Icon(Icons.search),
          hintText: 'Enter City Name',
          enabled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid
              )
            )

          ),
      ),
      ),
    )
    );
  }}