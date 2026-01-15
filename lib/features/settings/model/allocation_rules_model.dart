class AllocationRule {
  final String id;
  final String name;
  final String value;
  final int weight;
  final bool isActive;

  AllocationRule({
    required this.id,
    required this.name,
    required this.value,
    required this.weight,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'weight': weight,
      'is_active': isActive,
    };
  }

  factory AllocationRule.fromJson(Map<String, dynamic> json) {
    return AllocationRule(
      id: json['id'],
      name: json['value'],
      value: json['value'] ?? '',
      weight: json['weight'] ?? 0,
      isActive: json['is_active'] ?? true,
    );
  }
}
