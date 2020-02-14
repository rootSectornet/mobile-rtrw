import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/utils/colorapp.dart';


class Sarana extends StatefulWidget {
  @override
  _SaranaState createState() => _SaranaState();
}

class _SaranaState extends State<Sarana> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Image.asset("assets/images/vilage.jpg",fit: BoxFit.fill,width: MediaQuery.of(context).size.width,),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xfff5f5f5).withOpacity(0.5),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context,i){
                return ExpansionTile(
                  leading: Text("sss"),
                  title: Row(
                    children: <Widget>[
                      AutoSizeText("Jenis sarana &",maxFontSize: 16,minFontSize: 10,softWrap:true,overflow:TextOverflow.fade, maxLines: 1,),
                    ],
                  ),
                  backgroundColor: Color(0xfff5f5f5),
                  children: <Widget>[
                    ListTile(title: Text("hello"),),
                    ListTile(title: Text("hello"),),
                    ListTile(title: Text("hello"),)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}