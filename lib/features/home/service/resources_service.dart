import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/resources_model.dart';

class ResourcesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ResourceModel>> getResources() async {
    final snapshot = await _firestore.collection('resources').get();

    return snapshot.docs
        .map(
          (doc) => ResourceModel.fromJson(doc.data()),
        ) // sadece doc.data() kullan
        .toList();
  }
}
