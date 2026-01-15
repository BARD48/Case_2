import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> register({
    required String mail,
    required String password,
    required String name,
    required String city,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    );

    final uid = userCredential.user!.uid;
    final userModel = UserModel(uid: uid, mail: mail, name: name, city: city);

    await _firestore.collection('users').doc(uid).set(userModel.toJson());
  }

  Future<void> login({required String mail, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: mail,
      password: password,
    );
  }

  Future<String?> getUserRole(String uid) async {
    final doc = await _firestore.collection('managers').doc(uid).get();
    if (!doc.exists) return null;
    return doc.data()?['role'] as String?;
  }

  Future<bool> isManager(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return false;
    return doc.data()?['isManager'] ?? false;
  }
}
