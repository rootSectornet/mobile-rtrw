
import 'package:kampungku/model/user/user_model.dart';

abstract class LoginView{
  void refreshData(UserModel userModel);
  void onSuccess(String success);
  void onError(String error);
}