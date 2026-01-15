import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turkcell_project/features/settings/state/settings_state.dart';

import '../model/allocation_rules_model.dart';
import '../service/settings_service.dart';

class SettingsViewmodel extends Cubit<SettingsState> {
  SettingsViewmodel() : super(SettingsState(isLoading: false, list: []));
  SettingsService _service = SettingsService();
  Future<void> getRules() async {
    emit(state.copyWith(isLoading: false));

    try {
      List<AllocationRule> list = await _service.getRules();
      emit(state.copyWith(isLoading: true, list: list));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  adjustIsActive(index) {
    List<AllocationRule> list = List.from(state.list ?? []);
    list[index] = list[index].copyWith(isActive: !list[index].isActive);
    emit(state.copyWith(isLoading: true, list: list));
  }

  adjustWeigh(index, weigh) {
    List<AllocationRule> list = List.from(state.list ?? []);
    list[index] = list[index].copyWith(weight: weigh);
    emit(state.copyWith(isLoading: true, list: list));
  }
}
