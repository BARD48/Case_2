import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/components/appbar.dart';
import '../../../core/components/base_button.dart';
import '../../../core/components/bottom_bar_container.dart';
import '../../../core/components/chip.dart';
import '../../../core/components/list_item_selection.dart';
import '../../../core/components/text_input.dart';
import '../../../core/constants/dynamic_constants.dart';
import '../../../core/constants/text_constants.dart';

import '../../../core/cubits/bottom_sheet.dart';
import '../../../core/theme/custom_themes/text_theme.dart';
import 'settings_bottomsheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings Rules',
        actions: [],
        isVisibleLeading: false,
      ),
      bottomNavigationBar: BottomActionBar(
        color: Constant.fillBase(context),
        baseButtonType: BaseButtonType.filledGreen,
        title: 'Update',
        callback: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.symmetricPadding(16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Prioritaze your rules',
                        style: Theme.of(context).textTheme.labelBaseStrong,
                      ),
                      SizedBox(width: 2),
                      Text(
                        '*',
                        style: Theme.of(context).textTheme.labelBaseStrong
                            .copyWith(color: Constant.errorIcon(context)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListItemSelection(
              title: 'Choose your rules',
              callback: () {
                context.read<BottomSheetBloc>().showBottomSheet(
                  context: context,
                  widget: RulesBottomSheet(),
                );
                // context.pushNamed('categories');
              },
              listItemSelectionType: ListItemSelectionType.idleCard,
            ),
            SizedBox(height: 8),
            Column(
              children: List.generate(5, (index) {
                return SizedBox(
                  child: TextInputWidget(
                    // hintText: '1/2 Pound of Andoulle Sausage',
                    controller: TextEditingController(
                      text: '1/2 Pound of Andoulle Sausage',
                    ),
                    keyboardType: TextInputType.text,
                    suffixIcon: PhosphorIcon(
                      PhosphorIcons.trash(),
                      size: 20,
                      color: Constant.iconBase(context),
                    ),
                  ),
                );
              }),
            ),

            // Text('Service', style: Theme.of(context).textTheme.labelBaseStrong),
          ],
        ),
      ),
    );
  }
}
