import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kampungku/fragment/loaderColor.dart';
import 'package:kampungku/model/user/user_model.dart';
import 'package:kampungku/presenter/login/loginpresenter.dart';
import 'package:kampungku/utils/apppath.dart';
import 'package:kampungku/utils/clipperbottom.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:kampungku/view/login/loginview.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView{

  LoginPresenter _loginPresenter;
  UserModel _userModel;

  final _formkey = GlobalKey<FormState>();

  _LoginScreenState(){
    this._loginPresenter = new LoginPresenter();


    AppPath.CheckUser().then((check){
      if(check){
        Navigator.pushReplacementNamed(context, "/");
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 380.0,
              padding: EdgeInsets.only(bottom: 0),
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: ClipperBottom(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 380.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorApp.primary,
                            ColorApp.primaryaccent
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    right: 0,
                    child:Image.asset("assets/images/login.png",fit: BoxFit.fill,width: 200,),
                  ),
                  Positioned(
                    top: 180,
                    left:35,
                    child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                  ),
                  Positioned(
                    top: 84,
                    left:35,
                    child: Text("Selamat Datang di aplikasi KampungKu.",style: TextStyle(fontSize: 16,color: Colors.white,),),
                  ),
                  Positioned(
                    top: 110,
                    left:35,
                    child: Text("Temukan Berbagai kegiatan dan informasi\ndisekitarmu",style: TextStyle(fontSize: 12,color: Colors.white,),),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 35,right: 35),
              child: this._userModel.Isloading ? Center(child: LoaderColor(),) : Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 30,
                      margin: EdgeInsets.only(
                          top: 4,left: 16,bottom: 1,right: 16
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                            bottom: BorderSide(
                                width:1,
                                color: this._userModel.IsErrorUsername ? ColorApp.errorfield : ColorApp.secondary
                            ),
                          )
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              this._userModel.IsErrorUsername = true;
                              this._userModel.UsernameError = "Nik tidak boleh kosong";
                            });
                          }
                          return null;
                        },
                        onChanged: (str) {
                          setState(() {
                            this._userModel.IsErrorUsername = false;
                            this._userModel.UsernameError = null;
                          });
                        },
                        controller: this._userModel.username,
                        style: TextStyle(color: Colors.grey,fontSize: 14),
                        decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.userCircle,color: this._userModel.IsErrorUsername ? ColorApp.errorfield : ColorApp.secondary,size: 16,),
                            hintText: this._userModel.UsernameLabel,
                            border: InputBorder.none,
                            errorStyle: TextStyle(color: ColorApp.errorfield,fontSize: 9),
                            fillColor: Colors.grey,
                            errorText: this._userModel.UsernameError,
                            hintStyle:  TextStyle(color: this._userModel.IsErrorUsername ? ColorApp.errorfield : ColorApp.secondary,fontSize: 12)
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 30,
                      margin: EdgeInsets.only(
                          top: 4,left: 16,bottom: 1,right: 16
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                            bottom: BorderSide(
                                width:1,
                                color: this._userModel.IsErrorPassword ? ColorApp.errorfield : ColorApp.secondary
                            ),
                          )
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              this._userModel.IsErrorPassword = true;
                              this._userModel.PasswordError = "Password tidak boleh Kosong";
                            });
                          }
                          return null;
                        },
                        controller: this._userModel.password,
                        obscureText: true,
                        onChanged: (str){
                          setState(() {
                            this._userModel.IsErrorPassword = false;
                            this._userModel.PasswordError = null;
                          });
                        },
                        style: TextStyle(color: Colors.grey,fontSize: 14),
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock,color: this._userModel.IsErrorPassword ? ColorApp.errorfield : ColorApp.secondary,size: 18,),
                            hintText: this._userModel.PasswordLabel,
                            border: InputBorder.none,
                            errorText: this._userModel.PasswordError,
                            errorStyle: TextStyle(color: ColorApp.errorfield,fontSize: 9),
                            fillColor: Colors.grey,
                            hintStyle:  TextStyle(color: this._userModel.IsErrorPassword ? ColorApp.errorfield : ColorApp.secondary,fontSize: 12)
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: ColorApp.secondary,
                      onTap: (){
                        if(_formkey.currentState.validate()){
                          this._loginPresenter.loginClicked();
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 50.0),
                        height: 43,
                        width: MediaQuery.of(context).size.width/1.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  ColorApp.primaryaccent,
                                  ColorApp.primary
                                ]
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Text(
                            "Login".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
//                    Center(
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Text("Lupa Password ? ",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey),),
//                          InkWell(
//                            child:Text("Klik Disini ",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),),
//                        ],
//                      ),
//                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._loginPresenter.view=this;
  }


  @override
  void onError(String error) {
    // TODO: implement onError
    Fluttertoast.showToast(msg: error);
  }

  @override
  void onSuccess(String success) {
    // TODO: implement onSuccess
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  void refreshData(UserModel userModel) {
    // TODO: implement refreshData
    setState(() {
      this._userModel = userModel;
    });
  }
}
