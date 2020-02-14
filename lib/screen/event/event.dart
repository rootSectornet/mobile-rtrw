import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kampungku/blocservice/Eventservicebloc.dart';
import 'package:kampungku/fragment/circleimage.dart';
import 'package:kampungku/fragment/loaderColor.dart';
import 'package:kampungku/model/event/event_model.dart';
import 'package:kampungku/model/event/eventresponse.dart' as eventres;
import 'package:kampungku/parent/userprovider.dart';
import 'package:kampungku/presenter/event_presenter.dart';
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/clipperbottom.dart';
import 'package:kampungku/view/event/event_view.dart';

class Event extends StatefulWidget {


  final Widget child;
  Event({this.child, Key key})
      : super(
    key: key,
  );



  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> implements Eventview{

  // define atribute
    Event_model _eventModel;
    EventPresenter _eventPresenter;
    Eventservicebloc _eventservicebloc = new Eventservicebloc();
    
  // constructor
    _EventState(){
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
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF7cdff7),
                          const Color(0xFF10498f),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                      )
                  ),
                  child: Image.asset("assets/images/vilage.jpg",fit: BoxFit.fill,),
                ),
              ),
          Container(
            width: MediaQuery.of(context).size.width,
              color: Color(0xfff5f5f5).withOpacity(0.5),
            child: StreamBuilder<ApiResponse<List<eventres.Data>>>(
              stream: this._eventservicebloc.eventStream,
              builder: (context,snapshot){
                if( snapshot.data == null){
                  return Center(child: LoaderColor(),);
                }else{
                  switch(snapshot.data.status){
                    case Status.LOADING:
                      return Center(child: LoaderColor(),);
                      break;
                    case Status.COMPLETED:
                      return Padding(
                          padding: EdgeInsets.only(top:2),
                          child: new ListView.builder(
                            itemCount: snapshot.data.data.length,
                            primary: false,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (ctx,i){
                              return InkWell(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10,left: 11,right: 11),
                                    child: Container(
//                                      padding: EdgeInsets.all(8),
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
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.0),
                                              bottomLeft: Radius.circular(8.0)
                                            ),
                                            child: Image.network("${snapshot.data.data[i].iMAGE}",
                                            fit: BoxFit.fill,
                                            height: 120,
                                            width: 120,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(left:7,top:10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(Icons.place,color: Colors.grey,size: 9,),
                                                      Text("${snapshot.data.data[i].lOKASI}",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 9
                                                      ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 7,),
                                                  AutoSizeText(
                                                    "${snapshot.data.data[i].tITTLE}",
                                                    maxFontSize: 18,
                                                    minFontSize: 15,
                                                    maxLines: 3,
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 7,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(Icons.calendar_today,color: Colors.grey,size: 9,),
                                                      Text(" ${this._eventPresenter.waktu(snapshot.data.data[i].tANGGAL)}",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 9
                                                        ),
                                                      ),
                                                    ],
                                                  ),
//                                                  SizedBox(height: 8,),
//                                                  Row(
//                                                    mainAxisAlignment: MainAxisAlignment.start,
//                                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                                    children: <Widget>[
//                                                      Text(" Lebih Lengkap",
//                                                        style: TextStyle(
//                                                            color: Colors.blueAccent,
//                                                            fontSize: 12
//                                                        ),
//                                                      ),
//                                                      Icon(Icons.arrow_forward_ios,color: Colors.blueAccent,size: 11,),
//                                                    ],
//                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              );
                            }
                          )
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
          ),
        ],
      ),
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