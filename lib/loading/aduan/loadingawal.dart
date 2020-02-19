import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';



class LoadingAduanAwal extends StatefulWidget {
  @override
  _LoadingAduanAwalState createState() => _LoadingAduanAwalState();
}

class _LoadingAduanAwalState extends State<LoadingAduanAwal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SkeletonAnimation(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
          ),
        ),
        Divider(height: 1),
        SizedBox(height: 20,),
        SkeletonAnimation(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
          ),
        ),
        SizedBox(height: 20,),
        SkeletonAnimation(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
          ),
        ),
        SizedBox(height: 20,),
        SkeletonAnimation(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
          ),
        ),
        SizedBox(height: 40,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SkeletonAnimation(
              child: Container(
                width: 180,
                height: 60,
              ),
            ),
            SkeletonAnimation(
              child: Container(
                width: 180,
                height: 60,
              ),
            ),
          ],
        )
      ],
    );
  }
}
