class AllocatinModel {
  final String? uid;
  final String? request_id;
  final String? resource_id;
  final int? priority_score;
  final String? status;
  final String? timestamp;

  AllocatinModel({
    required this.uid,
    this.request_id,
    this.resource_id,
    this.priority_score,
    this.status,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'request_id': request_id,
      'resource_id': resource_id,
      'status': status,
      'timestamp': timestamp,
      'priority_score': priority_score,
    };
  }

  factory AllocatinModel.fromJson(Map<String, dynamic> json) {
    return AllocatinModel(
      uid: json['uid'],
      request_id: json['request_id'],
      resource_id: json['resource_id'],
      status: json['status'],
      timestamp: json['timestamp'],
      priority_score: json['priority_score'],
    );
  }
}
