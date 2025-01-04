

import 'package:flutter/material.dart';

class NoWeatherInfo extends StatelessWidget{
  const NoWeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  Center(
        child:Text('There is no weather info start search',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold
        ),)


      ) );
  }

}