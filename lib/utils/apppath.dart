import 'package:shared_preferences/shared_preferences.dart';

class AppPath{

  static const String _iduser = "IDUSER";
  static const String _namauser = "NAMAUSER";
  static const String _fotouser = "FOTOUSER";
  static const String _notlp = "NOTLP";
  static const String _idrt = "IDRT";
  static const String _rt = "RT";
  static const String _rw = "RW";
  static const String _kelurahan = "KELURAHAN";



  static Future<String> getIdUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_iduser);
  }

  static void setIdUser(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_iduser, value);
  }


  static Future<String> getNamaUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_namauser);
  }

  static void setNamaUser(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_namauser, value);
  }
  static Future<String> getFotoUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fotouser);
  }

  static void setFotoUser(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_fotouser, value);
  }
  static Future<String> getNoTlp() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_notlp);
  }

  static void setNoTlp(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_notlp, value);
  }
  static Future<String> getIdRt() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_idrt);
  }

  static void setIdRt(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_idrt, value);
  }
  static Future<String> getRt() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_rt);
  }

  static void setRt(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_rt, value);
  }

  static Future<String> getRw() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_rw);
  }

  static void setRw(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_rw, value);
  }


  static Future<String> getKelurahan() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kelurahan);
  }

  static void setKelurahan(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_kelurahan, value);
  }

  static Future<bool> CheckUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_iduser);
  }



  static const String host = "http://192.168.105.219/rtrw/";
  static const String getEvent = "v1/Event/";
  static const String Sarana = "Sarana/getData";
  static const String Login = "v1/Auth/";



}