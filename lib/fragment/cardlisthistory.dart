import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/utils/apppath.dart';
import 'package:kampungku/utils/colorapp.dart';

class CardListHistory extends StatefulWidget {
  final Aduan aduan;
  final Function(Aduan) callback;
  const CardListHistory({Key key, this.aduan, this.callback}) : super(key: key);
  @override
  _CradListHistoryState createState() => _CradListHistoryState();
}

class _CradListHistoryState extends State<CardListHistory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
//      onTap: ()=>widget.callback(widget.aduan),
      onLongPress: ()=>widget.callback(widget.aduan),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 2,
          semanticContainer: true,
          borderOnForeground: true,
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
//            side: BorderSide(
//              color: ColorApp.primaryaccent.withOpacity(0.4),
//              width: 1
//            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText("#${widget.aduan.iDPENGADUAN}",
                          style: TextStyle(
                            color: ColorApp.primary,
                            fontSize: 16,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: (){print("comment");},
                              child: Icon(FontAwesomeIcons.comments,size: 16,color: Colors.grey,),
                            ),
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: (){print("edit history");},
                              child: Icon(Icons.more_vert,size: 16,color: Colors.grey,),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Laporan Terkait",style: TextStyle(color: Colors.grey)),
                          TextSpan(text: " ${widget.aduan.jENISPENGADUAN }",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          TextSpan(text: " di tujukan kepada Instansi",style: TextStyle(color: Colors.grey)),
                          TextSpan(text: " ${widget.aduan.tUJUAN }",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                        ]
                      ),
                    ),
                    SizedBox(height: 10,),
                    Visibility(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("${widget.aduan.cONTENT}",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(8),
                            child: GridView.builder(
                              itemCount: widget.aduan.lAMPIRAN.length,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              padding: EdgeInsets.all(8),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (ctx,i){
                                return InkWell(
//                                onLongPress: ()=>this.Confirm(i),
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
//                                      border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
                                    ),
                                    padding: EdgeInsets.all(5.0),
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.insert_drive_file,color: ColorApp.primaryaccent,size: 42,),
                                        Center(child:  AutoSizeText(widget.aduan.lAMPIRAN[i].lAMPIRAN,softWrap: true,maxLines: 1,maxFontSize: 11,minFontSize: 9,),)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.calendar_today,color: Colors.grey,size: 10,),
                        Text("  ${widget.aduan.tANGGAL}",style: TextStyle(fontSize: 10,color: Colors.grey),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: AppPath.statusLaporan[widget.aduan.sTATUS]["COLOR"],
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10))
                    ),
                    child: AutoSizeText(AppPath.statusLaporan[widget.aduan.sTATUS]["TEXT"],maxFontSize: 12,minFontSize: 9,style: TextStyle(color: Colors.white),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
