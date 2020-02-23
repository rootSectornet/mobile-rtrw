import 'package:flutter/material.dart';
import 'package:kampungku/utils/colorapp.dart';

class ButtonPrimary extends StatefulWidget {

  final VoidCallback ontap;
  final String text;
  final Icon icon;
  final double height;
  final double width;
  final LinearGradient gradient;
  const ButtonPrimary({Key key, this.ontap, this.text, this.icon, this.height, this.width, this.gradient}) : super(key: key);

  @override
  _ButtonPrimaryState createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        splashColor: ColorApp.secondary,
        onTap: widget.ontap,
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              gradient: widget.gradient,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.icon,
                Text(
                  "${widget.text}".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
