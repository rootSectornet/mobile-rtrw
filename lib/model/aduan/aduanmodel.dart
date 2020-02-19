import 'package:flutter/material.dart';
import 'package:kampungku/fragment/boxmultiupload.dart';
import 'package:kampungku/fragment/customdropdown.dart';
import 'package:kampungku/model/aduan/history.dart';

class AduanModel{
  String start = '0';
  String limit = '10';
  String iD = '';
  Aduan aduan = new Aduan();
  bool Ishow = false;
  RootipModel Kategori = null;
  RootipModel Instansi = null;
  String valueKategori = "-";
  String valueInstansi = "-";
  List<BoxMultiUploadItem> itemFiles = new List<BoxMultiUploadItem>();
  BoxMultiUploadItem itemBox = new BoxMultiUploadItem();
}