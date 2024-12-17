import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:itracelink/core/utils/constants.dart';

class HttpClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  HttpClient({
    required this.baseUrl,
    this.defaultHeaders = const {},
  });

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await http
          .get(
            Uri.parse('$baseUrl$endpoint'),
            headers: defaultHeaders,
          )
          .timeout(Duration(seconds: ApiConstants.timeoutDuration));

      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl$endpoint'),
            headers: {
              ...defaultHeaders,
              'Content-Type': 'application/json',
            },
            body: json.encode(body),
          )
          .timeout(Duration(seconds: ApiConstants.timeoutDuration));

      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final body = json.decode(response.body);
    
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else {
      throw ApiException(
        message: body['message'] ?? 'Unknown error occurred',
        statusCode: response.statusCode,
      );
    }
  }

  Exception _handleError(dynamic error) {
    if (error is ApiException) {
      return error;
    }
    return ApiException(
      message: error.toString(),
      statusCode: 500,
    );
  }
}