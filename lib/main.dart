import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itracelink/core/providers/auth_provider.dart';
import 'package:itracelink/core/providers/language_provider.dart';
import 'package:itracelink/core/providers/crop_provider.dart';
import 'package:itracelink/core/providers/order_provider.dart';
import 'package:itracelink/core/providers/payment_provider.dart';
import 'package:itracelink/core/repositories/auth_repository.dart';
import 'package:itracelink/core/repositories/crop_repository.dart';
import 'package:itracelink/core/repositories/order_repository.dart';
import 'package:itracelink/core/repositories/payment_repository.dart';
import 'package:itracelink/core/services/http_client.dart';
import 'package:itracelink/core/services/navigation_service.dart';
import 'package:itracelink/core/utils/constants.dart';
import 'package:itracelink/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final httpClient = HttpClient(baseUrl: ApiConstants.baseUrl);
  final navigationService = NavigationService();

  final authRepository = AuthRepository(httpClient);
  final cropRepository = CropRepository(httpClient);
  final orderRepository = OrderRepository(httpClient);
  final paymentRepository = PaymentRepository(httpClient);
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(authRepository)),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => CropProvider(cropRepository)),
        ChangeNotifierProvider(create: (_) => OrderProvider(orderRepository)),
        ChangeNotifierProvider(create: (_) => PaymentProvider(paymentRepository)),
        Provider.value(value: navigationService),
      ],
      child: ITraceLinkApp(navigationService: navigationService),
    ),
  );
}