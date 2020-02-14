

import 'package:kampungku/model/user/user_model.dart';
import 'package:kampungku/model/user/userresponse.dart';
import 'package:kampungku/utils/apppath.dart';
import 'package:kampungku/utils/rest.dart';
import 'package:kampungku/view/login/loginview.dart';

abstract class LoginPresenterAbstract{

  set view(LoginView view){}
  void loginClicked(){}


}


class LoginPresenter implements LoginPresenterAbstract{

  UserModel _userModel = new UserModel();
  LoginView _loginView;
  Rest _rest = new Rest();

  @override
  void loginClicked() {
    // TODO: implement loginClicked
    String nik,pass;
    nik = this._userModel.username.text;
    pass = this._userModel.password.text;

    this._userModel.Isloading = true;
    try{
      Map data = {
        'nik' : nik,
        'password': pass,
      };
      _rest.getPost(data, AppPath.Login).then((res){
        UserResponse userResponse = UserResponse.fromJson(res);
        if(userResponse.status){
          AppPath.setIdUser(userResponse.data.nIKWARGA);
          AppPath.setFotoUser(userResponse.data.fOTO);
          AppPath.setIdRt(userResponse.data.iDRT);
          AppPath.setNoTlp(userResponse.data.nOTELP);
          AppPath.setNamaUser(userResponse.data.nAMAWARGA);
          AppPath.setRt(userResponse.data.rT);
          AppPath.setRw(userResponse.data.rW);
          AppPath.setKelurahan(userResponse.data.kELURAHAN);
          this._loginView.onSuccess("${userResponse.message}");
        }else{
          this._loginView.onError("${userResponse.message}");
        }
      });
    }catch(E){
      print("$E");
    }

  }

  @override
  void set view(LoginView view) {
    // TODO: implement view
    this._loginView = view;
    this._loginView.refreshData(this._userModel);
  }

}