import 'package:flutter/material.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:line_icons/line_icons.dart';


class OptionHistory extends StatefulWidget {
  final Aduan aduan;
  final Function(Aduan,Function(BuildContext)) delete;
  const OptionHistory({Key key, @required this.aduan, this.delete}) : super(key: key);
  @override
  _OptionHistoryState createState() => _OptionHistoryState(aduan);
}

class _OptionHistoryState extends State<OptionHistory> {
  Aduan _aduan;
  _OptionHistoryState(Aduan aduan){
    this._aduan = aduan;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15,bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.grey[300], spreadRadius: 5)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Laporan #${widget.aduan.iDPENGADUAN}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 48,
                  color: Colors.orange,
                  child: ListTile(
                    onTap: ()=>Navigator.pushNamed(context,'/formaduan',arguments: _aduan),
                    leading: Icon(LineIcons.edit,size: 16,color: Colors.white,),
                    title: Text("Edit",style: TextStyle(fontSize: 16,color: Colors.white),),
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: Container(
                  height: 48,
                  color: Colors.red,
                  child: ListTile(
                    onTap: (){widget.delete(widget.aduan,ondelete(context));
                    },
                    leading: Icon(LineIcons.times,size: 16,color: Colors.white,),
                    title: Text("Hapus",style: TextStyle(fontSize: 16,color: Colors.white),),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  ondelete(BuildContext context){
    Navigator.of(context).pop();
  }
}
