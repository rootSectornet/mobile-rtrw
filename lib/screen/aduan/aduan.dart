import 'package:flutter/material.dart';

class Aduan extends StatefulWidget {
  @override
  _AduanState createState() => _AduanState();
}

class _AduanState extends State<Aduan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue,
    );
  }
}