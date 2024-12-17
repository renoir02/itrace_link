import 'package:itracelink/core/models/order.dart';
import 'package:itracelink/core/services/http_client.dart';

class OrderRepository {
  final HttpClient _client;

  OrderRepository(this._client);

  Future<List<Order>> getUserOrders(String userId) async {
    final response = await _client.get('/orders?userId=$userId');
    
    return (response['orders'] as List)
        .map((order) => Order.fromJson(order))
        .toList();
  }

  Future<Order> createOrder({
    required String buyerId,
    required String farmerId,
    required String cropId,
    required double quantity,
    required String unit,
  }) async {
    final response = await _client.post('/orders', {
      'buyerId': buyerId,
      'farmerId': farmerId,
      'cropId': cropId,
      'quantity': quantity,
      'unit': unit,
    });

    return Order.fromJson(response['order']);
  }

  Future<Order> updateOrderStatus(String orderId, OrderStatus status) async {
    final response = await _client.post('/orders/$orderId/status', {
      'status': status.toString(),
    });

    return Order.fromJson(response['order']);
  }
}