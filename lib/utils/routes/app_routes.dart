import 'package:seeku_bmi/pages/bmi_screen.dart';
import 'package:seeku_bmi/pages/intro_screen.dart';
import 'package:seeku_bmi/pages/result_screen.dart';
import 'package:seeku_bmi/pages/settings_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String intro = '/';
  static const String bmiCalculator = '/bmi-calculator';
  static const String result = '/result';
  static const String setting = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case bmiCalculator:
        return MaterialPageRoute(builder: (_) => const BMICalculatorScreen());

      case result:
        return MaterialPageRoute(
          builder: (_) => const ResultScreen(),
        );

      case setting:
        return MaterialPageRoute(builder: (_) => SettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
