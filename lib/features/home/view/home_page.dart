import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turkcell_project/core/constants/dynamic_constants.dart';
import 'package:turkcell_project/core/enums/enums.dart';
import 'package:turkcell_project/features/home/state/request_state.dart';

import '../../../core/components/appbar.dart';
import '../../../core/components/toggle.dart';
import '../../../core/constants/text_constants.dart';
import '../../../core/theme/theme_mode.dart';
import '../model/user/request_model.dart';
import '../viewmodel/request_viewmodel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RequestViewmodel viewmodel;
  bool isDark = true;
  @override
  void initState() {
    viewmodel = context.read<RequestViewmodel>();
    viewmodel.getAllRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Your Informations',
        actions: [
          Padding(
            padding: context.symmetricPadding(0, 16),
            child: GestureDetector(
              onTap: () {
                context.pushNamed('settings');
                // setState(() {
                //   isDark = !isDark;
                // });
                // themeProvider.toggleThemeMode(
                //   isDark ? ThemeMode.dark : ThemeMode.light,
                // );
              },
              child: PhosphorIcon(
                isDark ? PhosphorIconsFill.gear : PhosphorIconsBold.gear,
                color: isDark
                    ? Constant.iconPrimary(context)
                    : Constant.iconSecondary(context),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<RequestViewmodel, RequestState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: context.symmetricPadding(40, 0),
                  child: Text(
                    'DashBoard',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(3, (index) {
                        return Container(
                          // height: context.dynamicHeight(0.1),
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Constant.fillWhite(context),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Constant.borderLight(context),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tech Team',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                'Capasity:2',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'City:istanbul',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 20,
                    right: 20,
                    bottom: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bekleyenlar',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Tümünü Gör',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(child: Text('data')),
                        );
                      }),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(state.reqList.length, (index) {
                    CustomerRequest model = state.reqList[index];
                    return Container(
                      margin: context.symmetricPadding(4, 12),
                      padding: context.symmetricPadding(0, 20),
                      decoration: BoxDecoration(
                        color: Constant.fillWhite(context),
                      ),
                      width: context.dynamicWidth(1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.service?.title ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 8),
                          Text(
                            model.requestType?.name ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
