class SubscriptionPlan {
  final String id;
  final double amount;
  final int durationDays;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubscriptionPlan({
    required this.id,
    required this.amount,
    required this.durationDays,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'],
      amount: json['amount'].toDouble(),
      durationDays: json['durationDays'],
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}