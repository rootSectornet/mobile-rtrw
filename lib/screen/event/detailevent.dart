import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:indonesia/indonesia.dart';
import 'package:kampungku/model/event/eventresponse.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:line_icons/line_icons.dart';
class Detailevent extends StatefulWidget {

  final Data event;

  const Detailevent({Key key, this.event}) : super(key: key);

  @override
  _DetaileventState createState() => _DetaileventState(event);
}

class _DetaileventState extends State<Detailevent> {

  Data _event;

  _DetaileventState(Data event){
    this._event = event;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height/2.3,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    bottom: 20,
                      child:ClipRRect(
                          child: Image.network("${this._event.iMAGE}",fit: BoxFit.fill,),
                  )),
                  Positioned.fill(
                    bottom: 20,
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: FloatingActionButton(
                      onPressed: ()=>Navigator.pop(context),
                      elevation: 2,
                      backgroundColor: Colors.white,
                      mini: true,
                      child: Icon(Icons.arrow_back,size:24 ,color: Colors.black,),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding:EdgeInsets.only(top: 8,left: 7,right: 7,bottom: 6),
                        child: AutoSizeText("${this._event.tITTLE}",maxFontSize: 18,minFontSize:15,textAlign: TextAlign.center, maxLines: 6,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Description : ",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Html(data: this._event.cONTENT,),
                  SizedBox(height: 15,),
                  Text("Keterangan : ",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(LineIcons.calendar,size: 14,color: ColorApp.primary,),
                      SizedBox(width: 3,),
                      Text("${tanggal(DateTime.parse(this._event.tANGGAL))}")
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(LineIcons.map_marker,size: 14,color: ColorApp.primary,),
                      SizedBox(width: 3,),
                      Text("${this._event.lOKASI}")
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(LineIcons.user,size: 14,color: ColorApp.primary,),
                      SizedBox(width: 3,),
                      Text("${this._event.nAMAWARGA}")
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(LineIcons.phone_square,size: 14,color: ColorApp.primary,),
                      SizedBox(width: 3,),
                      Text("${this._event.nOTELP}")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
