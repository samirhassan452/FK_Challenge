import 'package:flapkap_challenge/app/features/bottom_navigation/bottom_navigation_exports.dart'
    show BottomNavigationScreen;
import 'package:flapkap_challenge/app/features/splash/splash_exports.dart'
    show SplashScreen;
import 'package:flutter/material.dart';
import 'package:flapkap_challenge/app/features/error/error_exports.dart'
    show NotFoundScreen;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show RoutesNames;

class Routers {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RoutesNames.bottomNavigationRoute:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
