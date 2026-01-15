import 'package:equatable/equatable.dart';
import '../../../../core/enums/enums.dart';

class CustomerRequest extends Equatable {
  final String? requestId;
  final String? userId;
  final TurkcellServiceEnum? service;
  final RequestEnum? requestType;
  final UrgencyEnum? urgency;
  final DateTime? createdAt;

  const CustomerRequest({
    this.requestId,
    this.userId,
    this.service,
    this.requestType,
    this.urgency,
    this.createdAt,
  });

  /// copyWith metodu
  CustomerRequest copyWith({
    String? requestId,
    String? userId,
    TurkcellServiceEnum? service,
    RequestEnum? requestType,
    UrgencyEnum? urgency,
    DateTime? createdAt,
  }) {
    return CustomerRequest(
      requestId: requestId ?? this.requestId,
      userId: userId ?? this.userId,
      service: service ?? this.service,
      requestType: requestType ?? this.requestType,
      urgency: urgency ?? this.urgency,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Firestore/JSON’dan model oluşturma
  factory CustomerRequest.fromJson(Map<String, dynamic> json) {
    return CustomerRequest(
      requestId: json['request_id'] ?? '',
      userId: json['user_id'] ?? '',
      service: json['service'] != null
          ? TurkcellServiceEnum.values.firstWhere(
              (e) => e.title == json['service'],
              orElse: () => TurkcellServiceEnum.turkcellMobile,
            )
          : null,
      requestType: json['request_type'] != null
          ? RequestEnum.values.firstWhere(
              (e) => e.value == json['request_type'],
              orElse: () => RequestEnum.balanceError,
            )
          : null,
      urgency: json['urgency'] != null
          ? UrgencyEnum.values.firstWhere(
              (e) => e.value == json['urgency'],
              orElse: () => UrgencyEnum.low,
            )
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  /// JSON’a çevirme
  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'user_id': userId,
      'service': service?.title ?? '',
      'request_type': requestType?.value,
      'urgency': urgency?.value,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    requestId,
    userId,
    service,
    requestType,
    urgency,
    createdAt,
  ];
}
