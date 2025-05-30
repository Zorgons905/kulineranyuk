class ProductModel {
  final String id;
  final String merchantId;
  final String name;
  final String description;
  final double price;
  final bool available;
  final DateTime createdAt;

  ProductModel({
    required this.id,
    required this.merchantId,
    required this.name,
    required this.description,
    required this.price,
    required this.available,
    required this.createdAt,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      merchantId: map['merchant_id'],
      name: map['name'],
      description: map['description'],
      price: double.parse(map['price'].toString()),
      available: map['available'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'merchant_id': merchantId,
      'name': name,
      'description': description,
      'price': price,
      'available': available,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
