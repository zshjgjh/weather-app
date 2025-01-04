import 'dart:math';

import 'package:dio/dio.dart';
import '../models/weather_model.dart';




class WeatherService {
  WeatherService(this.dio);
  final Dio dio;
  final String baseUrl='http://api.weatherapi.com/v1';
  final String apiKey='b946f1dd83584787b0d75632240607';

  Future<WeatherModel> getWeatherService({required String cityName}) async {
      try {
        Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
        WeatherModel weatherModel=WeatherModel.fromJson(response.data);
        return weatherModel;
      } on DioException catch (e) {
        final String errorMessage=e.response?.data['error']['message']??'oops there was an error, try later';
        throw Exception(errorMessage);
      }catch (e){

        throw Exception('oops there was an error, try later');


      }

  }
}