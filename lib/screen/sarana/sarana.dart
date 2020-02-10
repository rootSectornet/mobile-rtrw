import 'package:flutter/material.dart';


class Sarana extends StatefulWidget {
  @override
  _SaranaState createState() => _SaranaState();
}

class _SaranaState extends State<Sarana> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.purple,
    );
  }
}