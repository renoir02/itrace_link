import 'package:itracelink/core/models/payment.dart';
import 'package:itracelink/core/services/http_client.dart';

class PaymentRepository {
  final HttpClient _client;

  PaymentRepository(this._client);

  Future<Payment> initiatePayment({
    required String orderId,
    required String userId,
    required double amount,
    required PaymentMethod method,
    required String phoneNumber,
  }) async {
    final response = await _client.post('/payments', {
      'orderId': orderId,
      'userId': userId,
      'amount': amount,
      'method': method.toString(),
      'phoneNumber': phoneNumber,
    });

    return Payment.fromJson(response['payment']);
  }

  Future<Payment> getPaymentStatus(String paymentId) async {
    final response = await _client.get('/payments/$paymentId');
    return Payment.fromJson(response['payment']);
  }
}