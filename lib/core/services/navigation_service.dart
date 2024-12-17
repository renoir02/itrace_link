import 'package:flutter/material.dart';
import 'package:itracelink/core/utils/constants.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => navigatorKey.currentState!;

  Future<T?> navigateTo<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> replaceTo<T>(String routeName, {Object? arguments}) {
    return navigator.pushReplacementNamed<T, void>(
      routeName,
      arguments: arguments,
    );
  }

  void goBack<T>([T? result]) {
    return navigator.pop<T>(result);
  }

  Future<T?> navigateToAndRemoveUntil<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}