import 'package:flutter/material.dart';
import 'package:kampungku/screen/login/loginscreen.dart';
import 'package:kampungku/screen/wrappingscreen.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final WrappingScreen home = WrappingScreen();
    final LoginScreen login = LoginScreen();

    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (_) => login);
        break;
      case '/home' :
        return MaterialPageRoute(builder: (_) => home);
        break;
      default:
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}