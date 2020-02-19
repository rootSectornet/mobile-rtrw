

import 'package:kampungku/model/aduan/aduanmodel.dart';

abstract class Aduanview{
  void refreshData(AduanModel aduanModel){}
  void onSuccess(String success);
  void onError(String error);
}