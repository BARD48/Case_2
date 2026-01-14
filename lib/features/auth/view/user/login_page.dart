import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turkcell_project/core/components/base_button.dart';
import 'package:turkcell_project/core/components/text_input.dart';
import 'package:turkcell_project/core/constants/dynamic_constants.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../core/theme/custom_themes/text_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.allPadding(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: context.symmetricPadding(40, 0),
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            TextInputWidget(
              title: 'Name',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 8),
            TextInputWidget(
              title: 'Password',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'you dont have any account',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                GestureDetector(
                  onTap: () => context.pushNamed('register'),
                  child: Text(
                    ' Sign up for free',
                    style: Theme.of(context).textTheme.labelStrong.copyWith(
                      color: Constant.errorText(context),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: context.symmetricPadding(40, 0),
              child: BaseButton(
                title: 'Login',
                width: context.dynamicWidth(1),
                baseButtonType: BaseButtonType.filledGreen,
                baseButtonSize: BaseButtonSize.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
