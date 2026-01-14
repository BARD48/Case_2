import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turkcell_project/features/auth/viewmodel/user_viewmodel.dart';

import '../cubits/bottom_sheet.dart';

class AppProviders {
  AppProviders._();

  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<BottomSheetBloc>(create: (_) => BottomSheetBloc()),

      BlocProvider<UserViewmodel>(create: (_) => UserViewmodel()),
    ];
  }
}
