import 'package:flutter/material.dart';

import '../../../core/components/appbar.dart';
import '../../../core/components/base_button.dart';
import '../../../core/components/bottom_bar_container.dart';
import '../../../core/components/chip.dart';
import '../../../core/components/list_item_selection.dart';
import '../../../core/constants/dynamic_constants.dart';
import '../../../core/constants/text_constants.dart';
import '../../../core/theme/custom_themes/text_theme.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

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
        title: 'Send your request',
        callback: () {
          // context.pushNamed('addListingsSettingsPage');
        },
        // suffixIcon: PhosphorIcon(
        //   PhosphorIcons.arrowCircleRight(PhosphorIconsStyle.bold),
        //   size: 18,
        //   color: Constant.iconWhite(context),
        // ),
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
                        'Choose Urgency',
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
                  Row(
                    children: [
                      BaseChip(
                        type: ColorType.filledWarning,
                        title: 'EASY',
                        size: ChipSize.smallChip,
                      ),
                      SizedBox(width: 8),
                      BaseChip(
                        type: ColorType.filledInfo,
                        title: 'MEDIUM',
                        size: ChipSize.smallChip,
                      ),
                      SizedBox(width: 8),
                      BaseChip(
                        type: ColorType.filledError,
                        title: 'HARD',
                        size: ChipSize.smallChip,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListItemSelection(
              title: 'Service',
              callback: () {
                // context.read<BottomSheetBloc>().showBottomSheet(
                //   context: context,
                //   widget: CategoriesBottomsheet(),
                // );
                // context.pushNamed('categories');
              },
              listItemSelectionType: ListItemSelectionType.idleCard,
              subtitle: 'test',
            ),
            SizedBox(height: 8),
            ListItemSelection(
              title: 'Choose your issue',
              callback: () {
                // context.read<BottomSheetBloc>().showBottomSheet(
                //   context: context,
                //   widget: CategoriesBottomsheet(),
                // );
                // context.pushNamed('categories');
              },
              listItemSelectionType: ListItemSelectionType.idleCard,
              subtitle: 'test',
            ),
            // Text('Service', style: Theme.of(context).textTheme.labelBaseStrong),
          ],
        ),
      ),
    );
  }
}
