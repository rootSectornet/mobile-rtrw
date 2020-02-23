import 'dart:async';

import 'package:kampungku/model/sarana/saranaresponse.dart';
import 'package:kampungku/utils/apiresponse.dart';

class SaranaBlocService{

  StreamController _streamController = new StreamController<ApiResponse<List<JenisSarana>>>();

  StreamSink<ApiResponse<List<JenisSarana>>> get saranaStreamsink => _streamController.sink;


  Stream<ApiResponse<List<JenisSarana>>> get saranaStream => _streamController.stream;

  dispose() {
    _streamController?.close();
  }
}