import 'dart:async';

import 'package:kampungku/model/event/eventresponse.dart';
import 'package:kampungku/utils/apiresponse.dart';

class Eventservicebloc{

  StreamController _streamController = new StreamController<ApiResponse<List<Data>>>();

  StreamSink<ApiResponse<List<Data>>> get eventStreamsink => _streamController.sink;


  Stream<ApiResponse<List<Data>>> get eventStream => _streamController.stream;

  dispose() {
    _streamController?.close();
  }
}