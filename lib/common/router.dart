import 'package:go_router/go_router.dart';
import 'package:photo_travel/main.dart';
import 'package:photo_travel/screen/home_screen.dart';
import 'package:photo_travel/screen/logo_screen.dart';
import 'package:photo_travel/screen/register_screen.dart';
import 'package:photo_travel/screen/tab_screen.dart';
import 'package:photo_travel/widget/weather.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LogoScreen(),
    ),
    GoRoute(
      path: '/tab-main',
      builder: (context, state) => const TabMainScreen(),
      routes: [
        GoRoute(
            path: 'home',
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: 'weather',
                builder: (context, state) => const WeatherWidget(),
              )
            ]),
      ],
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
