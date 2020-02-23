import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kampungku/model/user/userresponse.dart';




class UserProvider extends InheritedWidget{

  StreamController controller;
   String nama;
  final User user;
  final Widget child;
  final data;
  UserProvider({
    Key key,
    @required this.nama,
    @required this.user,
    @required this.child,
    @required this.controller,
    @required this.data
  }) : assert(child != null),
        super(key: key, child: child);


  static UserProvider of(BuildContext context){
    return context.inheritFromWidgetOfExactType(UserProvider)
    as UserProvider;
  }


  @override
  bool updateShouldNotify(UserProvider old) => true;



}