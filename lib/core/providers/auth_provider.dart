import 'package:flutter/foundation.dart';
import 'package:itracelink/core/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  Future<bool> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      // TODO: Implement actual authentication logic
      await Future.delayed(const Duration(seconds: 2));

      _currentUser = User(
        id: '1',
        fullName: 'Test User',
        email: email,
        phoneNumber: '+250123456789',
        role: UserRole.farmer,
        preferredLanguage: 'en',
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }
}