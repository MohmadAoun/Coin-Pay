import 'package:coin_pay/core/routing/routes.dart';
import 'package:coin_pay/features/onBoarding/on_boarding.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'The route you are trying to reach doesn\'t exists',
              ),
            ),
          ),
        );
    }
  }
}
