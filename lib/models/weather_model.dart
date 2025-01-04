


class WeatherModel {
  final String cityName;
  final DateTime update;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String image;
  final String condition;
  final double wind;

  const WeatherModel({ required this.cityName,
    required this.update,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
     required this.image,
    required this.condition,
  required this.wind}) ;


  factory WeatherModel.fromJson(json){
    return WeatherModel(cityName: json['location']['name'],
        update:DateTime.parse(json['current']['last_updated']) ,
        temp: json['forcast']['forcastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forcast']['forcastday'][0]['day']['maxtemp_c'],
        minTemp: json['forcast']['forcastday'][0]['day']['mintemp_c'],
        image: json['forcast']['forcastday'][0]['condition']['text'],
        condition: json['forcast']['forcastday'][0]['condition']['icon'],
        wind:json['forcast']['forcastday'][0]['day']['maxwind_kph']);
  }



}