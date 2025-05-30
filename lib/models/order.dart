class Order {
  final String id;
  final String userId;
  final double totalPrice;
  final String status;
  final DateTime createdAt;
  final String? approvedBy;

  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    this.approvedBy,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      userId: map['user_id'],
      totalPrice: double.parse(map['total_price'].toString()),
      status: map['status'],
      createdAt: DateTime.parse(map['created_at']),
      approvedBy: map['approved_by'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'total_price': totalPrice,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'approved_by': approvedBy,
    };
  }
}
