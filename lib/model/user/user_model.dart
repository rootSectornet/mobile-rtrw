
import 'package:flutter/material.dart';

class UserModel{

  bool Isloading = false;
  bool IsSuccess = false;
  bool IsErrorUsername = false;
  bool IsErrorPassword = false;
  String UsernameLabel = "NIK";
  String PasswordLabel = "Password";
  String UsernameError = null;
  String PasswordError = null;
  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();


}
