class ResourceModel {
  final String resourceId;
  final String resourceType; // Artık bir Enum
  final int capacity;
  final String city;
  final String status;

  ResourceModel({
    required this.resourceId,
    required this.resourceType,
    required this.capacity,
    required this.city,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'resource_id': resourceId,
      'resource_type':
          resourceType, // Enum'u String olarak kaydeder (Örn: "TECH_TEAM")
      'capacity': capacity,
      'city': city,
      'status': status,
    };
  }

  factory ResourceModel.fromJson(Map<String, dynamic> map) {
    return ResourceModel(
      resourceId: map['resource_id'] ?? '',
      // String veriyi tekrar Enum'a çevirir
      resourceType: map['resource_type'],
      capacity: map['capacity'] ?? 0,
      city: map['city'] ?? '',
      status: map['status'] ?? 'AVAILABLE',
    );
  }
}
