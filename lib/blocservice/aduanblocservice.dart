import 'dart:async';

import 'package:kampungku/fragment/customdropdown.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/model/aduan/kategori.dart';
import 'package:kampungku/model/event/eventresponse.dart';
import 'package:kampungku/utils/apiresponse.dart';

class Aduanservicebloc{

  StreamController _streamController = new StreamController<ApiResponse<List<Aduan>>>();
  StreamController _kategoriStreamController = new StreamController<ApiResponse<List<RootipModel>>>();
  StreamController _instansiStreamController = new StreamController<ApiResponse<List<RootipModel>>>();
  StreamSink<ApiResponse<List<Aduan>>> get aduanStreamsink => _streamController.sink;
  StreamSink<ApiResponse<List<RootipModel>>> get kategoriStreamasink => _kategoriStreamController.sink;
  StreamSink<ApiResponse<List<RootipModel>>> get instansiStreamasink => _instansiStreamController.sink;
  Stream<ApiResponse<List<Aduan>>> get aduanStream => _streamController.stream;
  Stream<ApiResponse<List<RootipModel>>> get kategoriStream => _kategoriStreamController.stream;
  Stream<ApiResponse<List<RootipModel>>> get instansiStream => _instansiStreamController.stream;


  dispose() {
    _streamController?.close();
    _kategoriStreamController?.close();
    _instansiStreamController?.close();
  }
}