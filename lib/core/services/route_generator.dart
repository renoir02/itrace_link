import 'package:flutter/material.dart';
import 'package:itracelink/core/utils/constants.dart';
import 'package:itracelink/presentation/screens/auth/login_screen.dart';
import 'package:itracelink/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:itracelink/presentation/screens/onboarding/onboarding_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      
      case RouteNames.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      
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