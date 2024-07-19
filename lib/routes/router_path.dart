import 'package:flutter/material.dart';
import 'package:save_keys/screens/first_screen.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class Routerpaths {
  static const String home = '/';
  static const String config = '/config';
  static const String detail = '/detail';
  static const String splash = '/splash';
  static const String login = '/login';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
