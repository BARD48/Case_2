import 'package:equatable/equatable.dart';

class AllocationRule extends Equatable {
  final String id;
  final String field;
  final String value;
  final int weight;
  final bool isActive;

  const AllocationRule({
    required this.id,
    required this.field,
    required this.value,
    required this.weight,
    this.isActive = true,
  });

  /// copyWith metodu
  AllocationRule copyWith({
    String? id,
    String? field,
    String? value,
    int? weight,
    bool? isActive,
  }) {
    return AllocationRule(
      id: id ?? this.id,
      field: field ?? this.field,
      value: value ?? this.value,
      weight: weight ?? this.weight,
      isActive: isActive ?? this.isActive,
    );
  }

  /// JSON’a çevirme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'field': field,
      'value': value,
      'weight': weight,
      'is_active': isActive,
    };
  }

  /// JSON’dan oluşturma
  factory AllocationRule.fromJson(Map<String, dynamic> json) {
    return AllocationRule(
      id: json['id'] ?? '',
      field: json['field'] ?? '',
      value: json['value'] ?? '',
      weight: json['weight'] ?? 0,
      isActive: json['is_active'] ?? true,
    );
  }

  @override
  List<Object?> get props => [id, field, value, weight, isActive];
}
