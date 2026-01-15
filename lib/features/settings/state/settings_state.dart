import 'package:equatable/equatable.dart';

import '../model/allocation_rules_model.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.isLoading, required this.list});
  final bool isLoading;
  final List<AllocationRule>? list;

  @override
  List<Object?> get props => [isLoading, list];
  SettingsState copyWith({bool? isLoading, List<AllocationRule>? list}) =>
      SettingsState(
        isLoading: isLoading ?? this.isLoading,
        list: list ?? this.list,
      );
}
