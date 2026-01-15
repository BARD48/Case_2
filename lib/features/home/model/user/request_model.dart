import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/enums/enums.dart';

class CustomerRequest extends Equatable {
  final String? requestId;
  final String? userId;
  final TurkcellServiceEnum? service;
  final RequestEnum? requestType;
  final UrgencyEnum? urgency;
  // final DateTime? createdAt;

  const CustomerRequest({
    this.requestId,
    this.userId,
    this.service,
    this.requestType,
    this.urgency,
    // this.createdAt,
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
      // createdAt: createdAt ?? this.createdAt,
    );
  }

  factory CustomerRequest.fromJson(Map<String, dynamic> json) {
    final createdAtValue = json['created_at'];
    DateTime? date;

    if (createdAtValue != null) {
      if (createdAtValue is Timestamp) {
        date = createdAtValue.toDate(); // <-- buraya date yazdık
      } else if (createdAtValue is String) {
        date = DateTime.tryParse(createdAtValue); // <-- buraya da date yazdık
      }
    }

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
              (e) =>
                  e.value.toLowerCase() ==
                  (json['urgency'] as String).toLowerCase(),
              orElse: () => UrgencyEnum.low,
            )
          : UrgencyEnum.low,

      // createdAt: date,
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
      // 'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    requestId,
    userId,
    service,
    requestType,
    urgency,
    // createdAt,
  ];
}
