import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:turkcell_project/features/settings/state/settings_state.dart';

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
import '../settings_viewmodel/settings_viewmodel.dart';
import 'settings_bottomsheet.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsViewmodel viewmodel;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    viewmodel = context.read<SettingsViewmodel>();
    viewmodel.getRules();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings Rules', actions: []),
      bottomNavigationBar: BottomActionBar(
        color: Constant.fillBase(context),
        baseButtonType: BaseButtonType.filledGreen,
        title: 'Update',
        callback: () {},
      ),
      body: BlocBuilder<SettingsViewmodel, SettingsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
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
                              style: Theme.of(
                                context,
                              ).textTheme.labelBaseStrong,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextInputWidget(
                          title: 'New Rules',
                          hintText: 'urgency',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextInputWidget(
                          title: 'How many per cent',
                          hintText: '10%',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: BaseButton(
                            suffixIcon: PhosphorIcon(
                              PhosphorIcons.plusCircle(),
                            ),
                            height: context.dynamicHeight(0.055),
                            baseButtonType: BaseButtonType.filledGreen,
                            baseButtonSize: BaseButtonSize.small,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: context.symmetricPadding(24, 0),
                    child: Text(
                      'veya',
                      style: Theme.of(context).textTheme.labelBaseStrong,
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
                  SizedBox(height: 16),
                  Text(
                    'Toplam 100% tamamlanmalıdır',
                    style: Theme.of(context).textTheme.labelBaseStrong,
                  ),
                  Column(
                    children: List.generate(
                      state.list?.where((rule) => rule.isActive).length ?? 0,
                      (index) {
                        final activeRules = state.list
                            ?.where((rule) => rule.isActive)
                            .toList();
                        final rule = activeRules?[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: context.dynamicWidth(0.65),
                              child: TextInputWidget(
                                // hintText: '1/2 Pound of Andoulle Sausage',
                                controller: TextEditingController(
                                  text: rule?.field,
                                ),
                                keyboardType: TextInputType.text,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    viewmodel.adjustIsActive(index);
                                  },
                                  child: PhosphorIcon(
                                    PhosphorIcons.trash(),
                                    size: 20,
                                    color: Constant.iconBase(context),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextInputWidget(
                                title: '',
                                onTap: () {
                                  viewmodel.adjustWeigh(index, controller.text);
                                },
                                hintText: '${rule?.weight}%',
                                controller: TextEditingController(),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
