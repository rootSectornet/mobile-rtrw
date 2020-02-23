import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kampungku/parent/provider.dart';
import 'package:kampungku/parent/userprovider.dart';
import 'package:kampungku/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  var appState = new AppState(0);
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: appState,
      child: MaterialApp(
        title: 'Kampungku',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

class AppState extends ValueNotifier {
  AppState(value) : super(value);
}