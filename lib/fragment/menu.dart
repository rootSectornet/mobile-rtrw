import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/utils/apppath.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isLogin = false;


  @override
  void initState() {
    // TODO: implement initState
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
    return Drawer(
      semanticLabel: "menu",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Stack(
              children: <Widget>[
                Positioned.fill(child:Image.asset("assets/images/drawer.png",fit: BoxFit.fill,),),
                Positioned.fill(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    color: Colors.blueAccent.withOpacity(0.3),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: Card(
                    elevation: 2,
                    color: ColorApp.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding:EdgeInsets.only(top: 8,left: 7,right: 7,bottom: 6),
                      child: AutoSizeText("Kampungku",maxFontSize: 48,minFontSize:36,textAlign: TextAlign.center, maxLines: 6,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(0),
                  child: ListTile(
                    leading: Icon(LineIcons.calendar_times_o,size: 32,color: ColorApp.primaryaccent,),
                    title: Text('Acara & Kegiatan',style: TextStyle(color: Colors.black,fontSize: 18),),
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                    subtitle: Text("Temukan acara & kegiatan di sekitarmu.",style: TextStyle(fontSize: 10,color: Colors.black54),),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.all(0),
                  child: ListTile(
                    leading: Icon(LineIcons.tags,size: 32,color: ColorApp.primaryaccent,),
                    title: Text('Sarana & Prasarana',style: TextStyle(color: Colors.black,fontSize: 18),),
                    onTap: () {
                      Navigator.pushNamed(context, isLogin ? "/sarana" : "/login");
                    },
                    subtitle: Text("check ada sarana apa aja di wilayahmu.",style: TextStyle(fontSize: 10,color: Colors.black54),),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(0),
                  child: ListTile(
                    leading: Icon(LineIcons.file_text_o,size: 32,color: ColorApp.primaryaccent,),
                    title: Text('Laporan',style: TextStyle(color: Colors.black,fontSize: 18),),
                    onTap: () {

                      Navigator.pushNamed(context, isLogin ? "/history" : "/login");
                    },
                    subtitle: Text("buat laporan kepada pengurus wilayahmu",style: TextStyle(fontSize: 10,color: Colors.black54),),
                  ),
                ),
                Divider(color: Colors.grey,indent: 2,endIndent: 2,height: 2,),
                Visibility(
                  visible: !isLogin,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(0),
                    child: ListTile(
                      leading: Icon(LineIcons.sign_in,size: 32,color: ColorApp.primaryaccent,),
                      title: Text('Login',style: TextStyle(color: Colors.black,fontSize: 18),),
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      subtitle: Text("login untuk mendapatkan akses lebih.",style: TextStyle(fontSize: 10,color: Colors.black54),),
                    ),
                  ),
                ),
                Visibility(
                  visible: isLogin,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(0),
                    child: ListTile(
                      leading: Icon(LineIcons.sign_out,size: 32,color: ColorApp.primaryaccent,),
                      title: Text('Keluar',style: TextStyle(color: Colors.black,fontSize: 18),),
                      onTap: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.clear();
                        Navigator.pushNamed(context, "/");
                      },
                      subtitle: Text("jika keluar jangan lupa kata sandi anda",style: TextStyle(fontSize: 10,color: Colors.black54),),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(0),
                  child: ListTile(
                    leading: Icon(LineIcons.info_circle,size: 32,color: ColorApp.primaryaccent,),
                    title: Text('Info',style: TextStyle(color: Colors.black,fontSize: 18),),
                    onTap: () {
                    },
                    subtitle: Text("kampungku ini aplikasi apa sih ?",style: TextStyle(fontSize: 10,color: Colors.black54),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
