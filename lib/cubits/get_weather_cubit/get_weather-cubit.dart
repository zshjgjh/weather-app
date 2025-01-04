import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';


class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;
   String? cityName;

  getWeather({required String cityName}) async {
    emit(WeatherLoadedState());
    try {
       weatherModel= await WeatherService(Dio()).getWeatherService(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }

}
