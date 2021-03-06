import 'package:flutter/material.dart';
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



  static const String host = "http://192.168.60.92/";
  static const String getEvent = "v1/Event/";
  static const String Sarana = "v1/Sarana/";
  static const String Login = "v1/Auth/";
  static const String KategoriAduan = "v1/Aduan/kategori/";
  static const String InstansiOptionAduan = "v1/Aduan/getOptionMyInstansi/";
  static const String HistoryAduan = "v1/Aduan/getMyHistory/";
  static const String KirimLaporan = "v1/Aduan/UploadLampiran";
  static const String HapusLaporan = "v1/Aduan/hapus";


  static const Map<String,Map<String,dynamic>> statusLaporan = {
    "0" : {"TEXT":"Menunggu Verifikasi","COLOR":Colors.orange},
    "1"  : {"TEXT":"Sedang Proses Tindak Lanjut","COLOR":Colors.lightBlue},
    "2" : {"TEXT":"Laporan Selesai","COLOR":Colors.green},
    "4" :{"TEXT":"Laporan Di Tolak","COLOR":Colors.red}
  };

}