import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/enums/enums.dart';
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
        .get();

    List<CustomerRequest> requests = snapshot.docs
        .map((doc) => CustomerRequest.fromJson(doc.data()))
        .toList();

    // Sadece urgency'ye göre sırala
    requests.sort((a, b) {
      int getPriority(UrgencyEnum? u) {
        switch (u) {
          case UrgencyEnum.high:
            return 3;
          case UrgencyEnum.medium:
            return 2;
          case UrgencyEnum.low:
            return 1;
          default:
            return 0;
        }
      }

      return getPriority(b.urgency).compareTo(getPriority(a.urgency));
    });

    return requests;
  }

  // Future<List<CustomerRequest>> getUserRequests(String userId) async {
  //   final snapshot = await _firestore
  //       .collection('users')
  //       .doc(userId)
  //       .collection('requests')
  //       .orderBy('created_at', descending: true)
  //       .get();
  //   //rojintemel02@gmail.com
  //   return snapshot.docs
  //       .map((doc) => CustomerRequest.fromJson(doc.data()))
  //       .toList();
  // }
}
