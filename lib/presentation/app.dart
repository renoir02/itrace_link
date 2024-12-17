import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itracelink/core/services/navigation_service.dart';
import 'package:itracelink/core/services/route_generator.dart';
import 'package:itracelink/core/theme/app_theme.dart';

class ITraceLinkApp extends StatelessWidget {
  final NavigationService _navigationService;

  const ITraceLinkApp({
    super.key,
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iTraceLink',
      theme: AppTheme.lightTheme,
      navigatorKey: _navigationService.navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteNames.splash,
    );
  }
}