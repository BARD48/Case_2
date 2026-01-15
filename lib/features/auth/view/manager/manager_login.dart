import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turkcell_project/core/components/base_button.dart';
import 'package:turkcell_project/core/components/text_input.dart';
import 'package:turkcell_project/core/constants/dynamic_constants.dart';
import 'package:turkcell_project/features/auth/state/user_state.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/theme/custom_themes/text_theme.dart';
import '../../viewmodel/user_viewmodel.dart';

class ManagerLoginPage extends StatefulWidget {
  const ManagerLoginPage({super.key});

  @override
  State<ManagerLoginPage> createState() => _ManagerLoginPageState();
}

class _ManagerLoginPageState extends State<ManagerLoginPage> {
  late UserViewmodel viewmodel;
  late TextEditingController mailController;
  late TextEditingController passwordController;
  bool isManager = false;
  @override
  void initState() {
    passwordController = TextEditingController();
    mailController = TextEditingController();
    viewmodel = context.read<UserViewmodel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserViewmodel, UserState>(
      builder: (context, state) {
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
                  title: 'Mail',
                  controller: mailController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 8),
                TextInputWidget(
                  title: 'Password',
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => context.pushNamed('login'),
                  child: Text(
                    'You are not any manager',
                    style: Theme.of(context).textTheme.labelStrong.copyWith(
                      color: Constant.errorText(context),
                    ),
                  ),
                ),

                Padding(
                  padding: context.symmetricPadding(40, 0),
                  child: BaseButton(
                    callback: () {
                      viewmodel.loginUser(
                        password: passwordController.text,
                        mail: mailController.text,
                      );
                      if (state.isChecked) {
                        context.pushNamed('home');
                      }
                    },
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
      },
    );
  }
}
