import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  CircleImage(
    this.imageProvider, {
    this.radius = 15,
  });

  final double radius;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    // wrapped around a column so that the avatar doesn't stretch
    return Column( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right:10),
                  child: CircleAvatar(
            radius: radius,
            backgroundImage: imageProvider,
          ),
        )
      ],
    );
  }
}