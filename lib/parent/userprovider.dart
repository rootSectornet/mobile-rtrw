import 'package:flutter/material.dart';
import 'package:kampungku/model/user/userresponse.dart';




class UserProvider extends InheritedWidget{

  final String nama;
  final User user;
  const UserProvider({
    Key key,
    @required this.nama,
    @required this.user,
    @required Widget child,
  }) : assert(nama != null),
        assert(child != null),
        super(key: key, child: child);
  static UserProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(UserProvider);
  @override
  bool updateShouldNotify(UserProvider old) => nama != old.nama;



}