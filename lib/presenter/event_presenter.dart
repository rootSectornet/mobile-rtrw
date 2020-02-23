import 'dart:convert';

import 'package:indonesia/indonesia.dart';
import 'package:kampungku/blocservice/Eventservicebloc.dart';
import 'package:kampungku/model/event/event_model.dart';
import 'package:kampungku/model/event/eventresponse.dart';
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/rest.dart';
import 'package:kampungku/view/event/event_view.dart';


abstract class EventPresenterAbstract{
  set view (Eventview eventview){}
  set servicebloc (Eventservicebloc eventservicebloc){}
  void getData(){}
  String waktu(String tanggal){}
  String bulan(String tannga){}
  Future<void> refresh(){}
}


class EventPresenter implements EventPresenterAbstract{
  // declare var objcet event model
    Event_model _eventModel;
  // declare var object event view
    Eventview _eventview;
  // declare var object blocservice nya
    Eventservicebloc _eventservicebloc;
  // create object rest untuk http request
    Rest _rest = new Rest();

  // constructor untuk init object model
    EventPresenter(){
      this._eventModel = new Event_model();
    }

  //set object bloc servicenya
  @override
  set servicebloc(Eventservicebloc eventservicebloc) {
    this._eventservicebloc = eventservicebloc;
  }


  // set view on screen and init model
  @override
  set view(Eventview eventview) {
    this._eventview = eventview;
    this._eventview.refreshData(this._eventModel);
  }

  @override
  void getData() {
    this._eventservicebloc.eventStreamsink.add(ApiResponse.loading("loading data"));
    String url = "${this._eventModel.getEvent}?id=${this._eventModel.iD}&start=${this._eventModel.start}&limit=${this._eventModel.limit}";
    _rest.getMethod(url).then((res){
      Event event = Event.fromJson(res);
      this._eventservicebloc.eventStreamsink.add(ApiResponse.completed(event.data));
    });
  }

  @override
  String waktu(String c) {
    // TODO: implement waktu
    DateTime a = DateTime.parse(c);
    return a.day.toString();
  }

  @override
  String bulan(String tanngal) {
    // TODO: implement bulan

    List longMonth = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
    List shortMonth = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];

    DateTime a = DateTime.parse(tanngal);
    return shortMonth[a.month -1];
  }

  @override
  Future<void> refresh() {
    // TODO: implement refresh
    this.getData();
    return Future.value();
  }
  







}
