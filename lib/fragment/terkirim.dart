import 'package:flutter/material.dart';
import 'package:kampungku/utils/colorapp.dart';


class Terkirim extends StatefulWidget {
//  final String errtext;
//
//  const Terkirim({Key key, this.errtext}) : super(key: key);
  @override
  _TerkirimState createState() => _TerkirimState();
}

class _TerkirimState extends State<Terkirim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.only(right: 40,left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset("assets/images/terkirim.png",fit: BoxFit.fill,width: MediaQuery.of(context).size.width/3,),
          SizedBox(height: 10,),
          Text("Terima Kasih,",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
          SizedBox(height: 10,),
          Text("Laporan anda akan dipelajari terlebih dahulu oleh pihak terkait sebelum di verifikasi dan di tindak lanjuti,",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black54),textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Text("Yuk cek laporan mu disini,",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black54),),
          OutlineButton.icon(
            onPressed: () {Navigator.pushNamed(context, '/history');},
            icon: Icon(Icons.history,),
            label: Text("History"),
//                        child: Text("Follow"),
            borderSide: BorderSide(color: Colors.blue),
            shape: StadiumBorder(),
            splashColor: ColorApp.primaryaccent,
          )
        ],
      ),
    );
  }
}
