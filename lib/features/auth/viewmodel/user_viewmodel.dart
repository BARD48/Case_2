import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/user_service.dart';
import '../state/user_state.dart';

class UserViewmodel extends Cubit<UserState> {
  UserViewmodel() : super(UserState(isChecked: false));
  AuthService _service = AuthService();

  Future<void> registerUser({
    required String name,
    required String city,
    required String password,
    required String mail,
  }) async {
    emit(state.copyWith(isChecked: false));
    try {
      await _service.register(
        mail: mail,
        password: password,
        name: name,
        city: city,
      );
      emit(state.copyWith(isChecked: true));
    } catch (e) {
      emit(state.copyWith(isChecked: false));
    }
  }

  Future<void> loginUser({
    required String password,
    required String mail,
  }) async {
    //roj123@gmail.com
    emit(state.copyWith(isChecked: false));

    try {
      await _service.login(mail: mail, password: password);
      emit(state.copyWith(isChecked: true));
    } catch (e) {
      emit(state.copyWith(isChecked: false));
    }
  }
}
