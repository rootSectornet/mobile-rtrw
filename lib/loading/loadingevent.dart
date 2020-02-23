import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';


class Loadingevent extends StatefulWidget {
  @override
  _LoadingeventState createState() => _LoadingeventState();
}

class _LoadingeventState extends State<Loadingevent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SkeletonAnimation(
            shimmerColor: Colors.grey,
            curve: Curves.linear,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
            ),
          ),
          SizedBox(height: 10,),
          SkeletonAnimation(
            shimmerColor: Colors.white54,
            gradientColor: const Color.fromARGB(0, 244, 244, 244),
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
            ),
          ),
          SizedBox(height: 10,),
          SkeletonAnimation(
            shimmerColor: Colors.white54,
            gradientColor: const Color.fromARGB(0, 244, 244, 244),
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
