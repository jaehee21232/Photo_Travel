import 'dart:async';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:photo_travel/common/data.dart';
import 'package:photo_travel/widget/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: page,
    );
    Timer.periodic(const Duration(seconds: 4), (timer) {
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      if (page == 3) {
        page = 0;
      } else {
        page += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool lightTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/imgs/logo/Logo_${lightTheme ? 'black' : 'white'}.png',
          scale: size.width * (0.06),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BannerCarousel.fullScreen(
                banners: listBanners,
                animation: false,
                pageController: pageController,
              ),
              WeatherWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
