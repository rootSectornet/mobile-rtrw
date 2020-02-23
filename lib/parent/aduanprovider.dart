
import 'package:flutter/material.dart';
import 'package:kampungku/blocservice/aduanblocservice.dart';
import 'package:kampungku/model/aduan/aduanmodel.dart';
import 'package:kampungku/presenter/aduan_presenter.dart';

class AduanProvider extends InheritedWidget{

  final AduanModel aduanModel;
  final Aduanservicebloc aduanservicebloc;
  final AduanPresenter aduanPresenter;
  const AduanProvider({
    Key key,
    @required this.aduanModel,
    @required this.aduanservicebloc,
    @required this.aduanPresenter,
    @required Widget child,
  }) : assert(aduanModel != null),
        assert(child != null),
        super(key: key, child: child);
  static AduanProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(AduanProvider);
  @override
  bool updateShouldNotify(AduanProvider old) =>
      aduanModel != old.aduanModel  || aduanservicebloc != old.aduanservicebloc || aduanPresenter != old.aduanPresenter;



}