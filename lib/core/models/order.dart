enum OrderStatus {
  pending,
  confirmed,
  rejected,
  completed,
  cancelled
}

class Order {
  final String id;
  final String buyerId;
  final String farmerId;
  final String cropId;
  final double quantity;
  final String unit;
  final double totalAmount;
  final double serviceFee;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Order({
    required this.id,
    required this.buyerId,
    required this.farmerId,
    required this.cropId,
    required this.quantity,
    required this.unit,
    required this.totalAmount,
    required this.serviceFee,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      buyerId: json['buyerId'],
      farmerId: json['farmerId'],
      cropId: json['cropId'],
      quantity: json['quantity'].toDouble(),
      unit: json['unit'],
      totalAmount: json['totalAmount'].toDouble(),
      serviceFee: json['serviceFee'].toDouble(),
      status: OrderStatus.values.firstWhere(
        (status) => status.toString() == json['status'],
      ),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buyerId': buyerId,
      'farmerId': farmerId,
      'cropId': cropId,
      'quantity': quantity,
      'unit': unit,
      'totalAmount': totalAmount,
      'serviceFee': serviceFee,
      'status': status.toString(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}