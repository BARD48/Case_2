import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/bottom_sheet.dart';

class AppProviders {
  AppProviders._();

  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<BottomSheetBloc>(create: (_) => BottomSheetBloc()),
      // BlocProvider<IngredientViewmodel>(
      //   create: (_) => IngredientViewmodel(_ingredientRepository),
      // ),
      // BlocProvider<CreateRecipeViewModel>(
      //   create: (_) => CreateRecipeViewModel(_recipeService),
      // ),
      // BlocProvider<CategoryViewModel>(create: (_) => CategoryViewModel()),
    ];
  }
}
