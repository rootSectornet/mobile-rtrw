import 'package:indonesia/indonesia.dart';
import 'package:kampungku/blocservice/saranablocservice.dart';
import 'package:kampungku/model/sarana/sarana_model.dart';
import 'package:kampungku/model/sarana/saranaresponse.dart';
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/apppath.dart';
import 'package:kampungku/utils/rest.dart';
import 'package:kampungku/view/sarana/saranaview.dart';


abstract class SaranaPresenterAbstract{
  set view (Saranaview saranaview){}
  set servicebloc (SaranaBlocService saranaBlocService){}
  void getData(){}
  String waktu(String tanggal){}
}


class SaranaPresenter implements SaranaPresenterAbstract{
  // declare var objcet Saran model
  SaranaModel _saranaModel;
  // declare var object Sarana view
  Saranaview _saranaview;
  // declare var object blocservice nya
  SaranaBlocService _saranaBlocService;
  // create object rest untuk http request
  Rest _rest = new Rest();

  // constructor untuk init object model
  SaranaPresenter(){
    this._saranaModel = new SaranaModel();
  }

  //set object bloc servicenya
  @override
  set servicebloc(SaranaBlocService  saranaBlocService) {
    this._saranaBlocService = saranaBlocService;
  }


  // set view on screen and init model
  @override
  set view(Saranaview saranaview) {
    this._saranaview = saranaview;
    this._saranaview.refreshData(this._saranaModel);
  }

  @override
  void getData() async {
    this._saranaBlocService.saranaStreamsink.add(ApiResponse.loading("loading data"));
    String idrt = await AppPath.getIdRt();
    String url = "${AppPath.Sarana}?idrt=$idrt";
    _rest.get(url).then((res){
      print("sds$res");
      SaranaResponse saranaResponse = SaranaResponse.fromJson(res);
      this._saranaBlocService.saranaStreamsink.add(ApiResponse.completed(saranaResponse.jenisSarana));
    });
  }

  @override
  String waktu(String c) {
    // TODO: implement waktu
    DateTime a = DateTime.parse(c);
    return tanggal(a).toString();
  }








}
