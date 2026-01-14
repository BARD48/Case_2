import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState({required this.isChecked});
  final bool isChecked;

  @override
  List<Object?> get props => [isChecked];
  UserState copyWith({bool? isChecked}) =>
      UserState(isChecked: isChecked ?? this.isChecked);
}
