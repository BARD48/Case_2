import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turkcell_project/features/auth/view/user/login_page.dart';
import 'package:turkcell_project/features/splash/view/splash_page.dart';

import '../../features/auth/view/manager/manager_login.dart';
import '../../features/auth/view/user/register_page.dart';
import '../../features/home/view/home_page.dart';
import '../../features/home/view/user_home_page.dart';
import '../../features/settings/view/settings_page.dart';
import '../components/bottom_nav_bar.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter appRouter = createRouter();

  static GoRouter createRouter() {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: "/login",
      observers: [KeyboardDismissObserver()],
      routes: [
        GoRoute(
          path: "/home",
          name: "home",
          builder: (context, state) => HomePage(),
          routes: [],
        ),
        GoRoute(
          path: "/userHome",
          name: "userHome",
          builder: (context, state) => UserHomePage(),
          routes: [],
        ),
        GoRoute(
          path: "/settings",
          name: "settings",
          builder: (context, state) => SettingsPage(),
          routes: [],
        ),
        GoRoute(
          path: "/splash",
          name: "splash",
          builder: (context, state) => SplashPage(),
          routes: [],
        ),
        GoRoute(
          path: "/register",
          name: "register",
          builder: (context, state) => RegisterPage(),
          routes: [],
        ),
        GoRoute(
          path: "/managerLogin",
          name: "managerLogin",
          builder: (context, state) => ManagerLoginPage(),
          routes: [],
        ),
        GoRoute(
          path: "/login",
          name: "login",
          builder: (context, state) => LoginPage(),
          routes: [],
        ),
        // StatefulShellRoute.indexedStack(
        //   builder: ((context, state, shell) => BottomNavBar(shell: shell)),
        //   branches: [
        //     StatefulShellBranch(
        //       routes: [
        //         GoRoute(
        //           path: "/home",
        //           name: "home",
        //           builder: (context, state) => HomePage(),
        //           routes: [],
        //         ),
        //       ],
        //     ),
        //     StatefulShellBranch(
        //       routes: [
        //         GoRoute(
        //           path: "/userHome",
        //           name: "userHome",
        //           builder: (context, state) => UserHomePage(),
        //           routes: [],
        //         ),
        //       ],
        //     ),
        //     StatefulShellBranch(
        //       routes: [
        //         GoRoute(
        //           path: "/settings",
        //           name: "settings",
        //           builder: (context, state) => SettingsPage(),
        //           routes: [],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // GoRoute(
        //   path: "/splash",
        //   name: "splash",
        //   builder: (context, state) => SplashPage(),
        //   routes: [],
        // ),
        // GoRoute(
        //   path: "/register",
        //   name: "register",
        //   builder: (context, state) => RegisterPage(),
        //   routes: [],
        // ),
        // GoRoute(
        //   path: "/managerLogin",
        //   name: "managerLogin",
        //   builder: (context, state) => ManagerLoginPage(),
        //   routes: [],
        // ),
        // GoRoute(
        //   path: "/login",
        //   name: "login",
        //   builder: (context, state) => LoginPage(),
        //   routes: [],
        // ),
      ],
    );
  }
}

class KeyboardDismissObserver extends NavigatorObserver {
  void _unfocus() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _unfocus();

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      _unfocus();

  void didPopNext(Route<dynamic> nextRoute) => _unfocus();
}

//ad@gmail.com
//rojintemel02@gmail.com
