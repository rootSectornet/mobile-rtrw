import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kampungku/blocservice/Eventservicebloc.dart';
import 'package:kampungku/fragment/btextfield.dart';
import 'package:kampungku/fragment/empty.dart';
import 'package:kampungku/fragment/menu.dart';
import 'package:kampungku/fragment/profile.dart';
import 'package:kampungku/loading/loadingevent.dart';
import 'package:kampungku/model/event/event_model.dart';
import 'package:kampungku/presenter/event_presenter.dart';
import 'package:kampungku/model/event/eventresponse.dart' as eventres;
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/clipperbottom.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:kampungku/view/event/event_view.dart';
import 'package:line_icons/line_icons.dart';


class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> implements Eventview {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // define atribute
  Event_model _eventModel;
  EventPresenter _eventPresenter;
  Eventservicebloc _eventservicebloc = new Eventservicebloc();

  // constructor
  _EventScreenState(){
    this._eventPresenter = new EventPresenter();
  }
  //init state awal
  @override
  void initState() {
    this._eventPresenter.view = this;
    this._eventPresenter.servicebloc = this._eventservicebloc;
    this._eventPresenter.getData();
    super.initState();
  }

  //saat object hilang
  @override
  void dispose() {
    this._eventservicebloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
//      extendBodyBehindAppBar: true,
    appBar: AppBar(
      elevation: 0,
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
    ),
      extendBody: true,
      drawer: Menu(),
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
                  onRefresh: ()=>this._eventPresenter.refresh(),
                  child: SingleChildScrollView(
//                    padding: EdgeInsets.only(top: 20),
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
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
                                  Text("Acara & Kegiatan",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
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
                                        Icon(FontAwesomeIcons.search,color: Colors.black,size: 16,),
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
                                                hintText:"temukan acara & kegiatan di sekitarmu",
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
                                child: StreamBuilder<ApiResponse<List<eventres.Data>>>(
                                  stream: this._eventservicebloc.eventStream,
                                  builder: (context,snapshot){
                                    if( snapshot.data == null){
                                      return Loadingevent();
                                    }else{
                                      switch(snapshot.data.status){
                                        case Status.LOADING:
                                          return Loadingevent();
                                          break;
                                        case Status.COMPLETED:
                                          if(snapshot.data.data.length > 0){
                                            return Container(
                                              width: MediaQuery.of(context).size.width,
                                                height: MediaQuery.of(context).size.height,
                                                padding: EdgeInsets.only(top:0),
                                                child: new ListView.builder(
                                                    itemCount: snapshot.data.data.length,
                                                    primary: false,
                                                    physics: ClampingScrollPhysics(),
                                                    scrollDirection: Axis.vertical,
                                                    padding: EdgeInsets.only(top: 0),
                                                    itemBuilder: (ctx,i){
                                                      return InkWell(
                                                        onTap: ()=>Navigator.pushNamed(context,'/detailevent',arguments: snapshot.data.data[i]),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width,
                                                          height: 180,
                                                          padding: EdgeInsets.only(top: 0,left: 11,right: 11),
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Positioned(
                                                                top:0,
                                                                bottom: 18,
                                                                left: 5,
                                                                right: 5,
                                                                child: Card(
                                                                  elevation: 1,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                  ),
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    child: Image.network("${snapshot.data.data[i].iMAGE}",
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                bottom: 0,
                                                                left: 10,
                                                                right: 10,
                                                                child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    side: BorderSide(
                                                                      color: Colors.black.withOpacity(0.3),
                                                                      width: 0.3,
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      children: <Widget>[
                                                                        Container(
                                                                          width: 50,
                                                                          decoration: BoxDecoration(
                                                                            border: Border(
                                                                              right: BorderSide(
                                                                                color: Color(0xfff5f5f5),
                                                                                width: 1,
                                                                              )
                                                                            ),
                                                                          ),
                                                                          child: Column(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              Text("${this._eventPresenter.waktu(snapshot.data.data[i].tANGGAL)}",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                                                                              SizedBox(height: 2,),
                                                                              Text("${this._eventPresenter.bulan(snapshot.data.data[i].tANGGAL)}",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 8,
                                                                        ),
                                                                        Expanded(
                                                                          child: Column(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                                                              AutoSizeText("${snapshot.data.data[i].tITTLE}",style: TextStyle(color: Colors.black87),maxLines: 1,minFontSize: 14,maxFontSize: 16,overflow: TextOverflow.ellipsis,wrapWords: true,softWrap: true,),
                                                                              SizedBox(height: 2,),
                                                                              Row(
                                                                                children: <Widget>[
                                                                                  Icon(Icons.location_on,size: 10,color: Colors.red,),
                                                                                  SizedBox(height: 2,),
                                                                                  AutoSizeText("${snapshot.data.data[i].lOKASI}",style: TextStyle(color: Colors.black54),maxLines: 1,minFontSize: 8,maxFontSize: 10,overflow: TextOverflow.ellipsis,wrapWords: true,softWrap: true,),
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
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
                  ),
                );
              }
            ),
          ),
        ],
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
  void refreshData(Event_model eventModel) {
    setState(() {
      this._eventModel = eventModel;
    });
  }

}
