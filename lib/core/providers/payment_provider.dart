import 'package:flutter/foundation.dart';
import 'package:itracelink/core/models/payment.dart';
import 'package:itracelink/core/repositories/payment_repository.dart';

class PaymentProvider with ChangeNotifier {
  final PaymentRepository _repository;
  Payment? _currentPayment;
  bool _isLoading = false;
  String? _error;

  PaymentProvider(this._repository);

  Payment? get currentPayment => _currentPayment;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<Payment?> initiatePayment({
    required String orderId,
    required String userId,
    required double amount,
    required PaymentMethod method,
    required String phoneNumber,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _currentPayment = await _repository.initiatePayment(
        orderId: orderId,
        userId: userId,
        amount: amount,
        method: method,
        phoneNumber: phoneNumber,
      );
      
      _isLoading = false;
      notifyListeners();
      return _currentPayment;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<void> checkPaymentStatus(String paymentId) async {
    try {
      _isLoading = true;
      notifyListeners();

      _currentPayment = await _repository.getPaymentStatus(paymentId);
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}