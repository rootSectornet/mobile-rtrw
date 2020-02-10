import 'package:flutter/material.dart';
import 'package:kampungku/fragment/circleimage.dart';

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Acara & Kegiatan",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
          InkWell(
            child: CircleImage(AssetImage("assets/images/usr.jpg"))
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          
        ),
      ),
    );
  }
}