import 'package:flutter/material.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:skeleton_text/skeleton_text.dart';


class LoadingSarana extends StatefulWidget {
  @override
  _LoadingSaranaState createState() => _LoadingSaranaState();
}

class _LoadingSaranaState extends State<LoadingSarana> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SkeletonAnimation(
              curve: Curves.easeInToLinear,
              shimmerColor: Colors.grey,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 0.1,
                      )
                    ]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SkeletonAnimation(
              curve: Curves.easeInToLinear,
              shimmerColor: Colors.grey,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 0.1,
                      )
                    ]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SkeletonAnimation(
              curve: Curves.easeInToLinear,
              shimmerColor: Colors.grey,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 0.1,
                      )
                    ]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SkeletonAnimation(
              curve: Curves.easeInToLinear,
              shimmerColor: Colors.grey,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 0.1,
                      )
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
