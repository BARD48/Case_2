import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/base_button.dart';
import '../../../../core/components/text_input.dart';
import '../../../../core/constants/dynamic_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/theme/custom_themes/text_theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                'Register',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            TextInputWidget(
              title: 'Name',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
            TextInputWidget(
              title: 'Password',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
            TextInputWidget(
              title: 'City',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: context.symmetricPadding(8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'You register before',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  GestureDetector(
                    onTap: () => context.pushNamed('login'),
                    child: Text(
                      ' Login',
                      style: Theme.of(context).textTheme.labelStrong.copyWith(
                        color: Constant.errorText(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BaseButton(
              title: 'Register',
              width: context.dynamicWidth(1),
              baseButtonType: BaseButtonType.filledGreen,
              baseButtonSize: BaseButtonSize.medium,
            ),
          ],
        ),
      ),
    );
  }
}
