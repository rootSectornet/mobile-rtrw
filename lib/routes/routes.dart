import 'package:flutter/material.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/model/event/eventresponse.dart' as eventdata;
import 'package:kampungku/screen/aduan/formaduan.dart';
import 'package:kampungku/screen/aduan/historyscreen.dart';
import 'package:kampungku/screen/event/detailevent.dart';
import 'package:kampungku/screen/event/eventscreen.dart';
import 'package:kampungku/screen/login/loginscreen.dart';
import 'package:kampungku/screen/sarana/sarana.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
//    print("asas ${settings.arguments}");
    final LoginScreen login = LoginScreen();
    final Historyscreen history = Historyscreen();
    final EventScreen eventScreen = EventScreen();
    final Sarana sarana = Sarana();
    final Detailevent detailevent = args is eventdata.Data ? Detailevent(event: args,) :Detailevent() ;
//    print("diaw $args");
    final FormAduan formAduan = args is Aduan ? FormAduan(aduan: args,) : FormAduan();
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (_) => eventScreen);
        break;
      case '/history' :
        return MaterialPageRoute(builder: (_) => history);
        break;
      case '/detailevent' :
        return MaterialPageRoute(builder: (_) => detailevent);
        break;
      case '/login' :
        return MaterialPageRoute(builder: (_) => login);
        break;
      case '/sarana' :
        return MaterialPageRoute(builder: (_) => sarana);
        break;
      case '/formaduan' :
        return MaterialPageRoute(builder: (_) => formAduan);
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