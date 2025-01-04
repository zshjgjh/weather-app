

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';


class WeatherInfo extends StatelessWidget{

   WeatherInfo(this.weatherModel, {Key? key}) : super(key: key) ;
   final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    var weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return   Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [getThemeColor(),
            getThemeColor()[300]!,
            getThemeColor()[50]!]
          )

        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(weatherModel!.cityName,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  )
              ),
              Text('Updated at ${weatherModel.update.hour}:${weatherModel.update.minute}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  Image(image: NetworkImage(weatherModel.image)),
                  const SizedBox(width: 150,),
                  Text('${weatherModel.temp}',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 150,),
                  Column(
                    children: [
                      Text('maxTemp:${weatherModel.maxTemp}',
                          style: const TextStyle(
                            fontSize: 14,)),
                      Text('minTemp:${weatherModel.minTemp}',
                          style: const TextStyle(
                            fontSize: 14,)),
                      Text('wind:${weatherModel.wind}kph',
                          style: const TextStyle(
                            fontSize: 14,)),

                    ],
                  )
                ],
              ),
               Text('${weatherModel.condition}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              )

            ],
          ),
        ),
      ),


    );
  }

}