class MerchantRequestModel {
  final String id;
  final String userId;
  final DateTime submittedAt;
  final String status;

  MerchantRequestModel({
    required this.id,
    required this.userId,
    required this.submittedAt,
    required this.status,
  });

  factory MerchantRequestModel.fromMap(Map<String, dynamic> map) {
    return MerchantRequestModel(
      id: map['id'],
      userId: map['user_id'],
      submittedAt: DateTime.parse(map['submitted_at']),
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'submitted_at': submittedAt.toIso8601String(),
      'status': status,
    };
  }
}
