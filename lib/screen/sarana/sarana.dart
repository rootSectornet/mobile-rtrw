import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/blocservice/saranablocservice.dart';
import 'package:kampungku/fragment/empty.dart';
import 'package:kampungku/fragment/loaderColor.dart';
import 'package:kampungku/fragment/menu.dart';
import 'package:kampungku/fragment/profile.dart';
import 'package:kampungku/loading/loadingsarana.dart';
import 'package:kampungku/model/sarana/sarana_model.dart';
import 'package:kampungku/model/sarana/saranaresponse.dart';
import 'package:kampungku/presenter/saranapresenter.dart';
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/clipperbottom.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:kampungku/view/sarana/saranaview.dart';
import 'package:line_icons/line_icons.dart';


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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    return Scaffold(
        key: _scaffoldKey,
//      extendBodyBehindAppBar: true,
//        appBar: AppBar(
//          elevation: 0,
//          leading: IconButton(onPressed: ()=>_scaffoldKey.currentState.openDrawer(), icon: Icon(LineIcons.bars,color: Colors.white,size: 30,),iconSize: 30,color: Colors.white,),
//          flexibleSpace: Container(
//            decoration: BoxDecoration(
//                gradient: LinearGradient(
//                  colors: [
//                    ColorApp.primary,
//                    ColorApp.primaryaccent
//                  ],
//                  begin: const FractionalOffset(0.0, 0.0),
//                  end: const FractionalOffset(1.0, 0.0),
//                )
//            ),
//          ),
//        ),
//        extendBody: true,
        drawer: Menu(),
        body: SafeArea(
          child: NestedScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: IconButton(onPressed: ()=>_scaffoldKey.currentState.openDrawer(), icon: Icon(LineIcons.bars,color: Colors.white,size: 30,),iconSize: 30,color: Colors.white,),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorApp.primary,
                            ColorApp.primaryaccent
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                        )
                    ),
                  ),
                )
              ];
            },
            body: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child:
                  ClipPath(
                    clipper: ClipperBottom(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 320.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ColorApp.primary,
                              ColorApp.primaryaccent
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                          )
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/bottom-circle.png"),
                ),
                Positioned.fill(
                  child: LayoutBuilder(
                      builder: (context, constraint) {
                        return RefreshIndicator(
                          onRefresh: ()=>this._saranaPresenter.refresh(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: constraint.maxHeight),
                            child: IntrinsicHeight(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
//                              height: 110,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(top: 5,left: 18,right: 18,bottom: 3),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Hero(child: Profile(),tag: "profile",),
                                        Text("Sarana & Prasana",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10,),
                                        Container(
                                            height: 40,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Color(0xfff5f5f5)
                                            ),
                                            padding: EdgeInsets.only(left: 8,right: 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(LineIcons.search,color: Colors.black,size: 16,),
                                                SizedBox(width: 10,),
                                                Container(
                                                  width: MediaQuery.of(context).size.width / 1.5,
                                                  height: 40,
                                                  child: TextFormField(
                                                    expands: true,
                                                    maxLines: null,
                                                    minLines: null,
                                                    style: TextStyle(color: Colors.black,fontSize: 12),
                                                    decoration: InputDecoration(
                                                        hintText:"cari tau sarana & prasarana di wilayahmu",
                                                        border: InputBorder.none,
                                                        fillColor: Colors.black,
                                                        hintStyle:  TextStyle(color: Colors.black54,fontSize: 12)
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Icon(Icons.filter_list,size: 16,),
                                                  ),
                                                )
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        child: StreamBuilder<ApiResponse<List<JenisSarana>>>(
                                          stream: this._saranaBlocService.saranaStream,
                                          builder: (context,snapshot){
                                            if( snapshot.data == null){
                                              return LoadingSarana();
                                            }else{
                                              switch(snapshot.data.status){
                                                case Status.LOADING:
                                                  return LoadingSarana();
                                                  break;
                                                case Status.COMPLETED:
                                                  if(snapshot.data.data.length > 0){
                                                    return Container(
                                                        width: MediaQuery.of(context).size.width,
                                                        height: MediaQuery.of(context).size.height,
                                                        padding: EdgeInsets.only(top:0,left: 10,right: 10),
                                                        child: new ListView.builder(
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
                                                        )
                                                    );
                                                  }else{
                                                    return Empty(errtext: "Tidak ada acara & kegiatan di sekitarmu...",);
                                                  }
                                                  break;
                                                case Status.ERROR:
                                                  return Empty(errtext: "Opps! Error while get data",);
                                                  break;
                                                default:
                                                  return Text('Handle no data page');
                                              }
                                            }
                                          },
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
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