

import 'package:kampungku/model/sarana/sarana_model.dart';

abstract class Saranaview{
  void refreshData(SaranaModel saranaModel){}
  void onSuccess(String success);
  void onError(String error);
}