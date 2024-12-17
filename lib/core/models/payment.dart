enum PaymentMethod {
  mtnMoney,
  airtelMoney
}

enum PaymentStatus {
  pending,
  processing,
  completed,
  failed
}

class Payment {
  final String id;
  final String orderId;
  final String userId;
  final double amount;
  final double serviceFee;
  final PaymentMethod method;
  final PaymentStatus status;
  final String? transactionId;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime? completedAt;

  Payment({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.amount,
    required this.serviceFee,
    required this.method,
    required this.status,
    this.transactionId,
    required this.phoneNumber,
    required this.createdAt,
    this.completedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      orderId: json['orderId'],
      userId: json['userId'],
      amount: json['amount'].toDouble(),
      serviceFee: json['serviceFee'].toDouble(),
      method: PaymentMethod.values.firstWhere(
        (method) => method.toString() == json['method'],
      ),
      status: PaymentStatus.values.firstWhere(
        (status) => status.toString() == json['status'],
      ),
      transactionId: json['transactionId'],
      phoneNumber: json['phoneNumber'],
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'userId': userId,
      'amount': amount,
      'serviceFee': serviceFee,
      'method': method.toString(),
      'status': status.toString(),
      'transactionId': transactionId,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }
}