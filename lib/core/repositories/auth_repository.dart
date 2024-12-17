import 'package:itracelink/core/models/user.dart';
import 'package:itracelink/core/services/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final HttpClient _client;
  
  AuthRepository(this._client);

  Future<User> signIn(String email, String password) async {
    final response = await _client.post('/auth/login', {
      'email': email,
      'password': password,
    });

    final user = User.fromJson(response['user']);
    await _saveAuthToken(response['token']);
    
    return user;
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeys.authToken);
    await prefs.remove(StorageKeys.userId);
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(StorageKeys.authToken);
  }

  Future<void> _saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeys.authToken, token);
  }
}