import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turkcell_project/features/auth/state/user_state.dart';
import 'package:turkcell_project/features/auth/viewmodel/user_viewmodel.dart';
import '../../../../core/components/base_button.dart';
import '../../../../core/components/text_input.dart';
import '../../../../core/constants/dynamic_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/theme/custom_themes/text_theme.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController cityController;
  late TextEditingController mailController;
  late UserViewmodel viewmodel;
  @override
  void initState() {
    viewmodel = context.read<UserViewmodel>();
    nameController = TextEditingController();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    cityController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserViewmodel, UserState>(
      builder: (context, userstate) {
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
                  title: 'Mail',
                  controller: mailController,
                  keyboardType: TextInputType.text,
                ),
                TextInputWidget(
                  title: 'Name',
                  controller: nameController,
                  keyboardType: TextInputType.text,
                ),
                TextInputWidget(
                  title: 'Password',
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                ),
                TextInputWidget(
                  title: 'City',
                  controller: cityController,
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
                          style: Theme.of(context).textTheme.labelStrong
                              .copyWith(color: Constant.errorText(context)),
                        ),
                      ),
                    ],
                  ),
                ),
                BaseButton(
                  callback: () async {
                    await viewmodel.registerUser(
                      name: nameController.text,
                      city: cityController.text,
                      password: passwordController.text,
                      mail: mailController.text,
                    );
                    print(' state${userstate}');

                    if (userstate.isChecked) {
                      context.pushNamed('home');
                    }
                    // roemel02@gmail.com
                  },
                  title: 'Register',
                  width: context.dynamicWidth(1),
                  baseButtonType: BaseButtonType.filledGreen,
                  baseButtonSize: BaseButtonSize.medium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
