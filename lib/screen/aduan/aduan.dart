//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:kampungku/blocservice/aduanblocservice.dart';
//import 'package:kampungku/fragment/boxmultiupload.dart';
//import 'package:kampungku/fragment/buttonPrimary.dart';
//import 'package:kampungku/fragment/customdropdown.dart';
//import 'package:kampungku/fragment/loaderColor.dart';
//import 'package:kampungku/model/aduan/aduanmodel.dart';
//import 'package:kampungku/model/aduan/history.dart';
//import 'package:kampungku/parent/provider.dart';
//import 'package:kampungku/parent/userprovider.dart';
//import 'package:kampungku/presenter/aduan_presenter.dart';
//import 'package:kampungku/utils/apiresponse.dart';
//import 'package:kampungku/utils/colorapp.dart';
//import 'package:kampungku/view/aduan/aduanview.dart';
//import 'package:skeleton_text/skeleton_text.dart';
//import 'package:kampungku/parent/aduanprovider.dart';
//
//class Aduan extends StatefulWidget {
//  Widget child;
//  Aduan({this.child, Key key})
//      : super(
//    key: key,
//  );
//  @override
//  _AduanState createState() => _AduanState();
//}
//
//class _AduanState extends State<Aduan> {
//
//  AduanModel _aduanModel;
//  Aduanservicebloc _aduanservicebloc = new Aduanservicebloc();
//  AduanPresenter _aduanPresenter = new AduanPresenter();
//  FocusNode contentFocus;
//
//
//  //init state awal
//  @override
//  void initState() {
////    this._aduanPresenter.view = this;
//    this._aduanPresenter.serviceBloc = this._aduanservicebloc;
//    this._aduanPresenter.listInstansi();
//    this._aduanPresenter.listKategori();
//    contentFocus = new FocusNode();
//    super.initState();
//  }
//
//  //saat object hilang
//  @override
//  void dispose() {
//    this._aduanservicebloc.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Provider.of(context).value = this._aduanModel;
//    return this._aduanModel.loadingsent
//        ? Center(child: LoaderColor(),)
//        : Container(
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
//      color: Color(0xfff5f6f8),
//          child: SingleChildScrollView(
//      physics: ClampingScrollPhysics(),
//      child: Padding(
//          padding: EdgeInsets.all(10),
//          child: Container(
//            padding: EdgeInsets.all(10),
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.circular(10),
//                boxShadow:[
//                  BoxShadow(
//                      blurRadius: 6,
////                    offset: Offset(15,
//                      color: Color(0xffdddddd).withOpacity(.6),
//                      spreadRadius: 2
//                  )
//                ]
//            ),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisSize: MainAxisSize.max,
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Expanded(
//                      child: Text("Buat Laporan ${this._aduanModel.testing}",
//                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
//                      ),
//                    ),
//                    OutlineButton.icon(
//                      onPressed: () {Navigator.pushNamed(context, '/history');},
//                      icon: Icon(Icons.history,),
//                      label: Text("History"),
////                        child: Text("Follow"),
//                      borderSide: BorderSide(color: Colors.blue),
//                      shape: StadiumBorder(),
//                      splashColor: ColorApp.primaryaccent,
//                    )
//                  ],
//                ),
//                SizedBox(height: 5,),
//                Divider(height: 1),
//                SizedBox(height: 20,),
//                TextField(
//                  decoration: InputDecoration(
//                    focusedBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(4)),
//                      borderSide: BorderSide(width: 0.5,color: ColorApp.primaryaccent),
//                    ),
//                    enabledBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(4)),
//                      borderSide: BorderSide(width: 0.5,color: ColorApp.primaryaccent),
//                    ),
//                    border: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(4)),
//                        borderSide: BorderSide(width: 0.5,)
//                    ),
//                    hintText: "Ketik Laporan Anda ...",
//                    hintStyle: TextStyle(fontSize: 16,color: Color(0xFFB3B1B1)),
//                  ),
//                  maxLines: 8,
//                  controller: this._aduanModel.content,
//                  focusNode: contentFocus,
//
//                ),
//                SizedBox(height: 20,),
//                StreamBuilder<ApiResponse<List<RootipModel>>>(
//                  stream: this._aduanservicebloc.kategoriStream,
//                  builder: (context, snapshot) {
//                    if(snapshot.data == null){
//                      return SkeletonAnimation(
//                        shimmerColor: Colors.grey,
//                        child: Container(
//                          height: 48,
//                          width: MediaQuery.of(context).size.width,
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(3),
//                            border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
//                          ),
//                        ),
//                      );
//                    }else{
//                      switch(snapshot.data.status){
//                        case Status.LOADING:
//                          return SkeletonAnimation(
//                            shimmerColor: Colors.grey,
//                            child: Container(
//                              height: 48,
//                              width: MediaQuery.of(context).size.width,
//                              decoration: BoxDecoration(
//                                color: Colors.white,
//                                borderRadius: BorderRadius.circular(3),
//                                border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
//                              ),
//                            ),
//                          );
//                          break;
//                        case Status.COMPLETED:
//                          return RootipDrowpdown(
//                            height: 48,
//                            width: MediaQuery.of(context).size.width,
//                            borderColor: ColorApp.primaryaccent,
//                            fillColor: Colors.white,
//                            hinttext: "Pilih Kategori",
//                            iconRight: Icon(Icons.arrow_drop_down,color: ColorApp.primary,size: 30,),
//                            showborder: true,
//                            value: this._aduanModel.valueKategori,
//                            calldata: (RootipModel data){
//                            setState(() {
//                              FocusScope.of(context).requestFocus(new FocusNode());
//                                this._aduanModel.valueKategori = "${data.label}";
//                                this._aduanModel.Kategori = data;
//                              });
//                            },
//                            data: snapshot.data.data,
//                          );
//                          break;
//                        case Status.ERROR:
//                          return Text('Error: ${snapshot.error}');
//                          break;
//                        default:
//                          return Text('Handle no data page');
//                      }
//                    }
//                  }
//                ),
//                SizedBox(height: 20,),
//                StreamBuilder<ApiResponse<List<RootipModel>>>(
//                    stream: this._aduanservicebloc.instansiStream,
//                    builder: (context, snapshot) {
//                      if(snapshot.data == null){
//                        return SkeletonAnimation(
//                          child: Container(
//                            height: 48,
//                            width: MediaQuery.of(context).size.width,
//                            decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius: BorderRadius.circular(3),
//                              border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
//                            ),
//                          ),
//                        );
//                      }else{
//                        switch(snapshot.data.status){
//                          case Status.LOADING:
//                            return SkeletonAnimation(
//                              child: Container(
//                                height: 48,
//                                width: MediaQuery.of(context).size.width,
//                                decoration: BoxDecoration(
//                                  color: Colors.white,
//                                  borderRadius: BorderRadius.circular(3),
//                                  border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
//                                ),
//                              ),
//                            );
//                            break;
//                          case Status.COMPLETED:
//                            return RootipDrowpdown(
//                              height: 48,
//                              width: MediaQuery.of(context).size.width,
//                              borderColor: ColorApp.primaryaccent,
//                              fillColor: Colors.white,
//                              hinttext: "Pilih Instansi Tujuan",
//                              iconRight: Icon(Icons.arrow_drop_down,color: ColorApp.primary,size: 30,),
//                              showborder: true,
//                              value: this._aduanModel.valueInstansi,
//                              calldata: (RootipModel data){
//                                setState(() {
//                                  FocusScope.of(context).requestFocus(new FocusNode());
//                                  this._aduanModel.valueInstansi = "${data.label}";
//                                  this._aduanModel.Instansi = data;
//                                });
//                              },
//                              data: snapshot.data.data,
//                            );
//                            break;
//                          case Status.ERROR:
//                            return Text('Error: ${snapshot.error}');
//                            break;
//                          default:
//                            return Text('Handle no data page');
//                        }
//                      }
//                    }
//                ),
//                SizedBox(height: 20,),
//                Visibility(
//                  visible: this._aduanModel.itemFiles.length > 0,
//                  child:BoxMultiUpload(data: this._aduanModel.itemFiles,aduanPresenter: this._aduanPresenter,),
//                ),
//                SizedBox(height: 20,),
//                Row(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Visibility(
//                      visible: this._aduanModel.itemFiles.length < 2,
//                      child: ButtonPrimary(
//                        height: 40,
////                      width: 80,
//                        icon: Icon(Icons.attachment,color: ColorApp.primary,),
//                        gradient: LinearGradient(
//                          colors: [
//                            Colors.grey,
//                            Colors.grey.withOpacity(0.6)
//                          ]
//                        ),
//                        text: "Attach File",
//                        ontap: ()=>this._aduanPresenter.attachClicked(),
//                      ),
//                    ),
//                    ButtonPrimary(
//                      height: 40,
////                      width: 80,
//                      icon: Icon(Icons.send,color: Colors.white,),
//                      gradient: LinearGradient(
//                          colors: [
//                            ColorApp.primaryaccent,
//                            ColorApp.primary
//                          ]
//                      ),
//                      text: "Send Laporan",
//                      ontap: ()=>this._aduanPresenter.send(),
//                    ),
//                  ],
//                ),
//                SizedBox(height: 20,),
//              ],
//            ),
//          ),
//      ),
//    ),
//        );
//  }
//
//}