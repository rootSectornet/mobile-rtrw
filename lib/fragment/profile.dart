import 'package:flutter/material.dart';
import 'package:kampungku/model/user/userresponse.dart';
import 'package:kampungku/utils/apppath.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool isLogin = false;
  User _user = new User();
  void initState() {
    // TODO: implement initState
    AppPath.getIdUser().then((a)=>this._user.nIKWARGA=a);
    AppPath.getNamaUser().then((a)=>_user.nAMAWARGA=a);
    AppPath.getFotoUser().then((a)=>_user.fOTO=a);
    AppPath.getNoTlp().then((a)=>_user.nOTELP=a);
    AppPath.getRt().then((a)=>_user.rT=a);
    AppPath.getRw().then((a)=>_user.rW=a);
    AppPath.getKelurahan().then((a)=>_user.kELURAHAN=a);

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    AppPath.CheckUser().then((check){
      if(check){
        setState(() {
          isLogin = true;
        });
      }else{
        setState(() {
          isLogin = false;
        });
      }
    });
    return Visibility(
      visible: isLogin,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/usr.jpg",),
              radius: 25,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("${this._user.nAMAWARGA}",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("${this._user.nOTELP}",style: TextStyle(fontSize: 12,color: Colors.white,)),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Warga Rt ${this._user.rT}/${this._user.rW} ${this._user.kELURAHAN}",style: TextStyle(fontSize: 12,color: Colors.white,)),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
