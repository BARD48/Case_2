import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user/request_model.dart';

class RequestService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRequest(CustomerRequest request) async {
    try {
      final userId = request.userId;
      if (userId == null) throw Exception("UserId boş olamaz");

      final docRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('requests')
          .doc();

      final requestWithId = request.copyWith(requestId: docRef.id);

      print('Yazma işlemi başlıyor...'); // Log ekle
      await docRef.set(requestWithId.toJson()).timeout(Duration(seconds: 10));
      print('Yazma işlemi başarılı!');
    } catch (e) {
      print('Hata oluştu: $e'); // Hatanın ne olduğunu burada göreceksiniz
    }
  }

  Future<List<CustomerRequest>> getUserRequests(String userId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('requests')
        .orderBy('created_at', descending: true)
        .get();
    //rojintemel02@gmail.com
    return snapshot.docs
        .map((doc) => CustomerRequest.fromJson(doc.data()))
        .toList();
  }
}
