import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turkcell_project/core/components/base_button.dart';
import 'package:turkcell_project/core/components/text_input.dart';
import 'package:turkcell_project/core/constants/dynamic_constants.dart';
import 'package:turkcell_project/features/auth/state/user_state.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/theme/custom_themes/text_theme.dart';
import '../../service/user_service.dart';
import '../../viewmodel/user_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UserViewmodel viewmodel;
  late TextEditingController mailController;
  late TextEditingController passwordController;
  bool isManager = false;
  @override
  void initState() {
    passwordController = TextEditingController(text: '123456');
    mailController = TextEditingController(text: 'ad@gmail.com');
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     GestureDetector(
                //       onTap: () => context.pushNamed('managerLogin'),
                //       child: Text(
                //         'You are a manager',
                //         style: Theme.of(context).textTheme.labelStrong.copyWith(
                //           color: Constant.errorText(context),
                //         ),
                //       ),
                //     ),
                //   ], //ad@gnail.com
                // ),
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
                    callback: () async {
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                              email: mailController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                        final firebaseUser = userCredential.user;
                        if (firebaseUser == null) return;

                        final userService = AuthService();
                        final role = await userService.getUserRole(
                          firebaseUser.uid,
                        );

                        if (!mounted) return;
                        print('role${role}');
                        if (role == "SUPER_ADMIN") {
                          context.go('/home'); // Yönetici sayfası
                        } else {
                          context.go('/userHome'); // Normal kullanıcı
                        }
                      } on FirebaseAuthException catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message ?? 'Login error')),
                        );
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
//ad@gmail.com