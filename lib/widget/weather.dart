import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:photo_travel/common/weather_crawling.dart';
import 'package:photo_travel/models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(
      future: getWeatherData('서울'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Text("문제있음");
        }
      },
    );
  }
}
