

import 'package:flutter/cupertino.dart';
import 'package:kampungku/model/aduan/aduanmodel.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/presenter/aduan_presenter.dart';

abstract class Aduanview{
  void refreshData(AduanModel aduanModel){}
  void onSuccess(String success);
  void onError(String error);
  void showOption(BuildContext context,Aduan aduan,AduanPresenter presenter);
}