import 'package:flutter/foundation.dart';
import 'package:itracelink/core/models/order.dart';
import 'package:itracelink/core/repositories/order_repository.dart';

class OrderProvider with ChangeNotifier {
  final OrderRepository _repository;
  List<Order> _orders = [];
  bool _isLoading = false;
  String? _error;

  OrderProvider(this._repository);

  List<Order> get orders => _orders;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getUserOrders(String userId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _orders = await _repository.getUserOrders(userId);
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<Order?> createOrder({
    required String buyerId,
    required String farmerId,
    required String cropId,
    required double quantity,
    required String unit,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final order = await _repository.createOrder(
        buyerId: buyerId,
        farmerId: farmerId,
        cropId: cropId,
        quantity: quantity,
        unit: unit,
      );

      _orders.add(order);
      _isLoading = false;
      notifyListeners();

      return order;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<bool> updateOrderStatus(String orderId, OrderStatus status) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final updatedOrder = await _repository.updateOrderStatus(orderId, status);
      
      final index = _orders.indexWhere((order) => order.id == orderId);
      if (index != -1) {
        _orders[index] = updatedOrder;
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}