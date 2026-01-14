import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turkcell_project/core/constants/dynamic_constants.dart';

import '../../../core/components/appbar.dart';
import '../../../core/components/toggle.dart';
import '../../../core/constants/text_constants.dart';
import '../../../core/theme/theme_mode.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = true;
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
                setState(() {
                  isDark = !isDark;
                });
                themeProvider.toggleThemeMode(
                  isDark ? ThemeMode.dark : ThemeMode.light,
                );
              },
              child: PhosphorIcon(
                isDark
                    ? PhosphorIconsFill.lightbulb
                    : PhosphorIconsBold.lightbulb,
                color: isDark
                    ? Constant.iconPrimary(context)
                    : Constant.iconSecondary(context),
              ),
            ),
          ),
        ],
        isVisibleLeading: false,
      ),
      body: SingleChildScrollView(
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
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
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
              children: List.generate(5, (index) {
                return Container(
                  margin: context.symmetricPadding(4, 12),
                  padding: context.symmetricPadding(0, 20),
                  decoration: BoxDecoration(color: Constant.fillWhite(context)),
                  width: context.dynamicWidth(1),
                  child: Text('data'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
