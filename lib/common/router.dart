import 'package:go_router/go_router.dart';
import 'package:photo_travel/main.dart';
import 'package:photo_travel/screen/logo_screen.dart';
import 'package:photo_travel/screen/tab_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LogoScreen(),
    ),
    GoRoute(
      path: '/tab-main',
      builder: (context, state) => const TabMainScreen(),
    )
  ],
);
