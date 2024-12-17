/// API Constants
class ApiConstants {
  static const String baseUrl = 'https://api.itracelink.com/v1';
  static const int timeoutDuration = 30; // seconds
  static const String authHeader = 'Authorization';
}

/// Storage Keys
class StorageKeys {
  static const String authToken = 'auth_token';
  static const String userId = 'user_id';
  static const String userRole = 'user_role';
  static const String language = 'language';
  static const String theme = 'theme';
}

/// Validation Constants
class ValidationConstants {
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  static const int phoneNumberLength = 10;
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String phoneRegex = r'^\+?[1-9]\d{1,14}$';
}

/// UI Constants
class UIConstants {
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 8.0;
  static const double buttonHeight = 48.0;
}

/// Route Names
class RouteNames {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String orders = '/orders';
  static const String payment = '/payment';
  static const String qrScanner = '/qr-scanner';
}