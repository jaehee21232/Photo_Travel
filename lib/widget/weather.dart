import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:photo_travel/common/weather_crawling.dart';
import 'package:photo_travel/models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  String weatherIcon(String weather) {
    DateTime now = DateTime.now();
    print(now);
    if (weather.contains('맑음')) {
      return 'sun';
    } else if (weather.contains('구름많음')) {
      return 'cloud_2';
    } else if (weather.contains('흐림')) {
      return 'cloud_3';
    } else if (weather.contains('약한 비')) {
      return 'rain_1';
    } else if (weather.contains('강한 비')) {
      return 'rain_3';
    } else if (weather.contains('매우 강한 비')) {
      return 'rain_4';
    } else if (weather.contains('비')) {
      return 'rain_2';
    } else if (weather.contains('눈')) {
      return 'snow';
    } else {
      return 'sun';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<WeatherModel>(
      future: getWeatherData('서울'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                borderRadius: BorderRadius.circular(24),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2)),
            width: size.width * (0.75),
            height: size.height * (0.18),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                'assets/imgs/weathers/${weatherIcon(snapshot.data!.weather.toString())}.png',
                              ),
                            ),
                            Text(
                              '${snapshot.data!.weather}',
                              style: TextStyle(
                                fontSize: size.width * (0.028),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${snapshot.data!.ta}°',
                              style: TextStyle(
                                fontSize: size.width * (0.12),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${snapshot.data!.name} ',
                                      style: TextStyle(
                                          fontSize: size.width * (0.05),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  '시정거리 : ${snapshot.data!.vs}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Text("문제있음");
        }
      },
    );
  }
}
