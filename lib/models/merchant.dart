class Merchant {
  final String id;
  final String userId;
  final String storeName;
  final String? description;
  final String? address;
  final bool approved;

  Merchant({
    required this.id,
    required this.userId,
    required this.storeName,
    this.description,
    this.address,
    required this.approved,
  });

  factory Merchant.fromMap(Map<String, dynamic> map) {
    return Merchant(
      id: map['id'],
      userId: map['user_id'],
      storeName: map['store_name'],
      description: map['description'],
      address: map['address'],
      approved: map['approved'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'store_name': storeName,
      'description': description,
      'address': address,
      'approved': approved,
    };
  }
}
