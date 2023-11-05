import 'package:flutter/material.dart';
import 'package:photo_travel/screen/home_screen.dart';

class TabMainScreen extends StatelessWidget {
  const TabMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(children: [
          HomeScreen(),
          Text('2'),
          Text('3'),
          Text('4'),
        ]),
        bottomNavigationBar: TabBar(tabs: [
          Tab(
            icon: Icon(
              Icons.home_outlined,
              size: size.width * (0.08),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.article,
              size: size.width * (0.08),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.location_on_outlined,
              size: size.width * (0.08),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.account_circle_outlined,
              size: size.width * (0.08),
            ),
          )
        ]),
      ),
    );
  }
}
