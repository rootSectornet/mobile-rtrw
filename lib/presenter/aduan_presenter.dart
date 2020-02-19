
import 'package:file_picker/file_picker.dart';


import 'package:kampungku/blocservice/aduanblocservice.dart';
import 'package:kampungku/fragment/customdropdown.dart';
import 'package:kampungku/model/aduan/aduanmodel.dart';
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
  void getData() {
    // TODO: implement getData
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
    this._aduanModel.itemFiles.removeAt(index);
    this._aduanview.refreshData(this._aduanModel);
  }

}