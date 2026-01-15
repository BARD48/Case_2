import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turkcell_project/features/home/model/user/request_model.dart';
import 'package:turkcell_project/features/home/state/request_state.dart';

import '../../../core/enums/enums.dart';
import '../service/req_service.dart';

class RequestViewmodel extends Cubit<RequestState> {
  RequestViewmodel()
    : super(
        RequestState(isLoading: false, req: CustomerRequest(), reqList: []),
      );
  RequestService _service = RequestService();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  void adjustUrgency({required UrgencyEnum urgency}) =>
      emit(state.copyWith(req: state.req.copyWith(urgency: urgency)));
  void adjustService({required TurkcellServiceEnum? service}) =>
      emit(state.copyWith(req: state.req.copyWith(service: service)));
  void adjustReq({required RequestEnum? requestType}) =>
      emit(state.copyWith(req: state.req.copyWith(requestType: requestType)));
  Future<void> sendRequest() async {
    emit(state.copyWith(isLoading: false));

    emit(
      state.copyWith(
        req: state.req.copyWith(userId: userId, createdAt: DateTime.now()),
      ),
    );
    print('${state.req.toJson()}');
    await _service.addRequest(state.req);

    emit(state.copyWith(isLoading: true));
  }

  Future<void> getUserRequests({required String userId}) async {
    emit(state.copyWith(isLoading: false));

    try {
      await _service.getUserRequests(userId);
      emit(state.copyWith(isLoading: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getAllRequests() async {
    List<CustomerRequest> allRequests = List.from(state.reqList);

    // 1️⃣ Tüm kullanıcıları al
    final usersSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .get();

    for (var userDoc in usersSnapshot.docs) {
      final userId = userDoc.id;

      // 2️⃣ Her kullanıcının requests alt koleksiyonunu al
      final requestsSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('requests')
          .get();

      // 3️⃣ Verileri CustomerRequest objesine çevir
      final userRequests = requestsSnapshot.docs
          .map((doc) => CustomerRequest.fromJson(doc.data()))
          .toList();

      allRequests.addAll(userRequests);
    }

    print('Toplam request sayısı: ${allRequests.length}');
    emit(state.copyWith(reqList: allRequests));
  }
}
