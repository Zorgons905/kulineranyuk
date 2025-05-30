class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final bool requestedMerchant;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.requestedMerchant,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
      requestedMerchant: map['requested_merchant'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'requested_merchant': requestedMerchant,
    };
  }
}
