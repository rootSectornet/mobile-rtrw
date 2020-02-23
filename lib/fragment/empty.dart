import 'package:flutter/material.dart';


class Empty extends StatefulWidget {
  final String errtext;

  const Empty({Key key, this.errtext}) : super(key: key);
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset("assets/images/empty.png",fit: BoxFit.fill,width: MediaQuery.of(context).size.width/3,),
          SizedBox(height: 10,),
          Text("${widget.errtext}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),)
        ],
      ),
    );
  }
}
