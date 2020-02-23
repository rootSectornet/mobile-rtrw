
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';


import 'package:kampungku/blocservice/aduanblocservice.dart';
import 'package:kampungku/fragment/boxmultiupload.dart';
import 'package:kampungku/fragment/customdropdown.dart';
import 'package:kampungku/model/aduan/aduanmodel.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/model/aduan/kategori.dart';
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/apppath.dart';
import 'package:kampungku/utils/rest.dart';
import 'package:path/path.dart';
import 'package:kampungku/view/aduan/aduanview.dart';

abstract class AduanPresenterAbstract{
  set view(Aduanview aduanview){}
  set serviceBloc(Aduanservicebloc aduanservicebloc){}
  void getData(){}
  void listKategori(){}
  void listInstansi(){}
  void attachClicked(){}
  void removeFile(int index){}
  void progresUpload(int sent, int total){}
  void send(){}
  void reset(){}
  void getMyhistory(StreamController streamController, int status){}
  Future<void> refresh(){}
  String getTabFilter(int i){}
  void hapus(String id){}
}

class AduanPresenter implements AduanPresenterAbstract{
  // declare var objcet event model
  AduanModel _aduanModel;
  // declare var object event view
  Aduanview _aduanview;
  // declare var object blocservice nya
  Aduanservicebloc _aduanservicebloc;
  // create object rest untuk http request
  Rest _rest = new Rest();

  // constructor untuk init object model
  AduanPresenter(){
    this._aduanModel = new AduanModel();
  }



  @override
  void getData() async {
    // TODO: implement getData
    this._aduanModel.loadingHistory = true;
    this._aduanview.refreshData(this._aduanModel);
    String nik = await AppPath.getIdUser();
    String url = "${AppPath.HistoryAduan}?nik=$nik&start=0";
    this._aduanservicebloc.aduanStreamsink.add(ApiResponse.loading("loading get instansi option"));
    _rest.get(url).then((res){
      print(res);
      History history = History.fromJson(res);
      this._aduanModel.MyAllhistory = history.data.data;
      this._aduanModel.Myhistory = this._aduanModel.MyAllhistory.where((i)=>
      i.sTATUS == this.getTabFilter(this._aduanModel.tabController.index)
      ).toList();
      this._aduanModel.loadingHistory = false;
      this._aduanview.refreshData(this._aduanModel);
      this._aduanservicebloc.aduanStreamsink.add(ApiResponse.completed(history.data.data));
    });
  }

  @override
  void listInstansi() async {
    // TODO: implement listInstansi
    String idrt = await AppPath.getIdRt();
    this._aduanservicebloc.instansiStreamasink.add(ApiResponse.loading("loading get instansi option"));
    String url = "${AppPath.InstansiOptionAduan}?idrt=$idrt";
    _rest.get(url).then((res){
      KategoriAduan kategoriAduan = KategoriAduan.fromJson(res);
      List<RootipModel> InstansiOption = new List<RootipModel>();
      kategoriAduan.data.forEach((kategori){
        InstansiOption.add(
            new RootipModel(kategori.id, kategori.text, null, null)
        );
      });
      this._aduanservicebloc.instansiStreamasink.add(ApiResponse.completed(InstansiOption));
    });
  }

  @override
  void listKategori() {
    // TODO: implement listKategori
    this._aduanservicebloc.kategoriStreamasink.add(ApiResponse.loading("Loading data"));
    String url = "${AppPath.KategoriAduan}";
    _rest.get(url).then((res){
      KategoriAduan kategoriAduan = KategoriAduan.fromJson(res);
      List<RootipModel> kategoriOption = new List<RootipModel>();
      kategoriAduan.data.forEach((kategori){
        kategoriOption.add(
          new RootipModel(kategori.id, kategori.text, null, null)
        );
      });
      this._aduanservicebloc.kategoriStreamasink.add(ApiResponse.completed(kategoriOption));
    });
  }

  @override
  void set serviceBloc(Aduanservicebloc aduanservicebloc) {
    // TODO: implement serviceBloc
    this._aduanservicebloc = aduanservicebloc;
  }

  @override
  void set view(Aduanview aduanview) {
    // TODO: implement view
    this._aduanview = aduanview;
    this._aduanview.refreshData(this._aduanModel);
  }

  @override
  void attachClicked() async {
    // TODO: implement attachClicked
    this._aduanModel.itemBox.file = await FilePicker.getFile();
    this._aduanModel.itemBox.Filename = basename(this._aduanModel.itemBox.file.path);
    this._aduanModel.itemBox.id = "a";
    this._aduanModel.itemFiles.add(this._aduanModel.itemBox);
    this._aduanview.refreshData(this._aduanModel);
  }

  @override
  void removeFile(int index) {
    // TODO: implement removeFile
    print("sds$index");
    if(this._aduanModel.iD != ''){
        this._aduanModel.idDeletedLampiran.add(this._aduanModel.itemFiles[index].id);
    }
    this._aduanModel.itemFiles.removeAt(index);
    this._aduanview.refreshData(this._aduanModel);
  }

  @override
  void progresUpload(int sent, int total) {
    // TODO: implement progresUpload
    print("kekirim $sent");
    print("total $total");
  }

  @override
  void send() async {
    // TODO: implement send
    this._aduanModel.loadingsent = true;
    this._aduanview.refreshData(this._aduanModel);
    String nik = await AppPath.getIdUser();
    FormData form = new FormData.fromMap({
      "content" : this._aduanModel.content.text,
      "id_pengaduan" : this._aduanModel.iD,
      "id_tujuan" : this._aduanModel.Instansi.id,
      "id_kategori" : this._aduanModel.Kategori.id,
      "nik" : nik,
      "id_delete_lampiran"  : jsonEncode(this._aduanModel.idDeletedLampiran)
    });
    Map<String,MultipartFile> lampiran;
    this._aduanModel.itemFiles.forEach((e) async{
      form.files.add(MapEntry(
          "lampiran[]",
          await MultipartFile.fromFile(e.file.path,filename: basename(e.file.path))
      ));
    });

    form.fields.forEach((e){print(e);});

    String url = "${AppPath.KirimLaporan}";
    _rest.formData(form, url,(int a , int b){this.progresUpload(a, b);},).then((res){

      print(res);
      Map<String,dynamic> tmpres = jsonDecode(res);

      this._aduanModel.loadingsent = false;
      this._aduanModel.Isent = true;
      this._aduanModel.content.clear();
      this._aduanModel.itemFiles = new List<BoxMultiUploadItem>();
      this._aduanModel.itemBox = new BoxMultiUploadItem();
      this._aduanview.refreshData(this._aduanModel);
      listKategori();
      listInstansi();
    });

  }

  @override
  void reset() {
    // TODO: implement reset
    this._aduanModel.loadingHistory = true;
  }

  @override
  void getMyhistory(StreamController streamController, int status) async {
    // TODO: implement getMyhistory
    String nik = await AppPath.getIdUser();
    String url = "${AppPath.HistoryAduan}?nik=$nik&start=0";
    print(url);
    _rest.get(url).then((res){
      print(res);
      History history = History.fromJson(res);
      streamController.add(history.data.data);
    });

  }

  @override
  Future<void> refresh() {
    // TODO: implement refresh
    this.getData();
    return Future.value();
  }

  @override
  String getTabFilter(int i) {
    // TODO: implement getTabFilter
    switch (i){
      case 0:
        return "0";
        break;
      case 1:
        return "1";
      case 2:
        return "2";
      case 3:
        return "4";
      default:
        return "0";
    }
  }

  @override
  void hapus(String id) {
    // TODO: implement hapus
    String url = "${AppPath.HapusLaporan}/?id=$id";
    _rest.get(url).then((res){
      print(res);

      this.getData();
    });

  }

}