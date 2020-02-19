import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/blocservice/saranablocservice.dart';
import 'package:kampungku/fragment/loaderColor.dart';
import 'package:kampungku/model/sarana/sarana_model.dart';
import 'package:kampungku/model/sarana/saranaresponse.dart';
import 'package:kampungku/presenter/saranapresenter.dart';
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:kampungku/view/sarana/saranaview.dart';


class Sarana extends StatefulWidget {


  final Widget child;
  Sarana({this.child, Key key})
      : super(
    key: key,
  );

  @override
  _SaranaState createState() => _SaranaState();
}

class _SaranaState extends State<Sarana> implements Saranaview{


  // define atribute
  SaranaModel _saranaModel;
  SaranaPresenter _saranaPresenter;
  SaranaBlocService _saranaBlocService = new SaranaBlocService();

  // constructor
  _SaranaState(){
    this._saranaPresenter = new SaranaPresenter();
  }
  //init state awal
  @override
  void initState() {
    this._saranaPresenter.view = this;
    this._saranaPresenter.servicebloc = this._saranaBlocService;
    this._saranaPresenter.getData();
    super.initState();
  }

  //saat object hilang
  @override
  void dispose() {
    this._saranaBlocService.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
//        margin: EdgeInsets.only(bottom: 50),
      padding: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 10),
      width: MediaQuery.of(context).size.width,
      color: Color(0xfff5f5f5).withOpacity(0.5),
      child: StreamBuilder<ApiResponse<List<JenisSarana>>>(
        stream: this._saranaBlocService.saranaStream,
        builder: (context,snapshot){
          if( snapshot.data == null){
            return Center(child: LoaderColor(),);
          }else{
            switch(snapshot.data.status){
              case Status.LOADING:
                return Center(child: LoaderColor(),);
                break;
              case Status.COMPLETED:
                print("wow ${snapshot.data.data}");
                return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,i){
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            snapshot.data.data[i].aCTIVE = snapshot.data.data[i].aCTIVE == "1" ? "2" : "1";
                          });
                        },
                        child: Container(
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: ColorApp.primary,
                                      radius: 15,
                                      child: Text("${snapshot.data.data[i].total}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: AutoSizeText("${snapshot.data.data[i].jENISSARANA}",
                                        maxLines: 2,
                                        maxFontSize: 16,
                                        minFontSize: 14,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                    Icon(snapshot.data.data[i].aCTIVE == "1" ? Icons.chevron_right : Icons.keyboard_arrow_down)

                                  ],
                                ),
                              ),
                              Visibility(
                                visible: snapshot.data.data[i].aCTIVE != "1",
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  color: Colors.grey.withOpacity(0.1),
                                  child: ListView.builder(
                                    itemCount: snapshot.data.data[i].sarana.length,
//                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx,a){
                                      return Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                          width: MediaQuery.of(context).size.width/1.5,
                                          height: 80,
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
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(Icons.place,color: Colors.grey,size: 9,),
                                                  Text("${snapshot.data.data[i].sarana[a].wILAYAH}",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 9
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 3,),
                                              Expanded(
                                                child: AutoSizeText(
                                                  "${snapshot.data.data[i].sarana[a].nAMASARANA}",
                                                  maxFontSize: 18,
                                                  minFontSize: 15,
                                                  maxLines: 3,
                                                  wrapWords: false,

                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(height: 3,),
                                              Expanded(
                                                child: Text(" ${snapshot.data.data[i].sarana[a].dETAIL}",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 9
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          )
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
                break;
              case Status.ERROR:
                return Text('Error: ${snapshot.error}');
                break;
              default:
                return Text('Handle no data page');
            }
          }
        },
      )
    );
  }

  @override
  void onError(String error) {
    print("$error");
  }

  @override
  void onSuccess(String success) {
    print("$success");
  }

  @override
  void refreshData(SaranaModel saranaModel) {
    setState(() {
      this._saranaModel = saranaModel;
    });
  }
}