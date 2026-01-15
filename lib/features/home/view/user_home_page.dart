import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turkcell_project/core/enums/enums.dart';
import 'package:turkcell_project/features/home/widget/request_botttomsheet.dart';
import 'package:turkcell_project/features/home/widget/service_bottomsheet.dart';

import '../../../core/components/appbar.dart';
import '../../../core/components/base_button.dart';
import '../../../core/components/bottom_bar_container.dart';
import '../../../core/components/chip.dart';
import '../../../core/components/list_item_selection.dart';
import '../../../core/constants/dynamic_constants.dart';
import '../../../core/constants/text_constants.dart';
import '../../../core/cubits/bottom_sheet.dart';
import '../../../core/theme/custom_themes/text_theme.dart';
import '../state/request_state.dart';
import '../viewmodel/request_viewmodel.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RequestViewmodel viewmodel = context.read<RequestViewmodel>();
    return BlocBuilder<RequestViewmodel, RequestState>(
      builder: (context, state) {
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
              viewmodel.sendRequest();
            },
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
                        children: List.generate(UrgencyEnum.values.length, (
                          index,
                        ) {
                          final urgency = UrgencyEnum.values[index];
                          // Burada title'ı istediğin gibi belirleyebilirsin
                          String title;
                          switch (urgency) {
                            case UrgencyEnum.high:
                              title = "High";
                              break;
                            case UrgencyEnum.medium:
                              title = "Medium";
                              break;
                            case UrgencyEnum.low:
                              title = "Low";
                              break;
                          }

                          return GestureDetector(
                            onTap: () {
                              viewmodel.adjustUrgency(urgency: urgency);
                            },
                            child: urgency.widgetWithTitle(
                              title,
                            ), // Extension kullanımı
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8),
                ListItemSelection(
                  title: 'Choose your request type',
                  callback: () {
                    context.read<BottomSheetBloc>().showBottomSheet(
                      context: context,
                      widget: RequestBottomSheet(),
                    );
                  },
                  listItemSelectionType: ListItemSelectionType.idleCard,
                  subtitle:
                      state.req.requestType?.name ??
                      'please choose your request type',
                ),
                SizedBox(height: 20),
                ListItemSelection(
                  title: 'Choose your service type',
                  callback: () {
                    context.read<BottomSheetBloc>().showBottomSheet(
                      context: context,
                      widget: ServiceBottomSheet(),
                    );
                  },
                  listItemSelectionType: ListItemSelectionType.idleCard,
                  subtitle:
                      state.req.service?.title ?? 'please choose your service ',
                  //rojintemel02@gmail.com
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
