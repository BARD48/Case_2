import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/allocation_rules_model.dart';

class SettingsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<AllocationRule>> getRules() async {
    final snapshot = await _firestore.collection('allocation_rules').get();

    return snapshot.docs
        .map((doc) => AllocationRule.fromJson(doc.data()))
        .toList();
  }
}
