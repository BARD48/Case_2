import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings_viewmodel/settings_viewmodel.dart';
import '../state/settings_state.dart';
import '../widget/base_filter_item.dart';

class RulesBottomSheet extends StatelessWidget {
  const RulesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsViewmodel viewmodel = context.read<SettingsViewmodel>();
    return BlocBuilder<SettingsViewmodel, SettingsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: List.generate(state.list?.length ?? 0, (index) {
              return BaseFitreItem(
                isChecked: state.list?[index].isActive ?? false,
                onChanged: () {
                  viewmodel.adjustIsActive(index);
                },
                widget: Row(
                  children: [
                    Text(
                      state.list?[index].field ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      state.list?[index].value ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
