import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/pages/no_weather_info.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/weather_info.dart';

import '../models/weather_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Weather App'),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(onPressed:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return const SearchPage();
          }));
        },
            icon: const Icon(Icons.search))
      ],
      ),
      body:BlocBuilder<GetWeatherCubit,WeatherState>(builder: (BuildContext context, state)
      {
        if(state is WeatherLoadedState) {
          return  const CircularProgressIndicator();
        }
        else if(state is WeatherSuccessState){
         WeatherModel? weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel;
          return WeatherInfo(weatherModel!);

        }
        else if(state is WeatherFailureState){
          return const Text('there was an error');
        }
        else {
          return const NoWeatherInfo();
        }

      },)
    );
  }
}

