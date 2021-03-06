import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kampungku/blocservice/aduanblocservice.dart';
import 'package:kampungku/fragment/boxmultiupload.dart';
import 'package:kampungku/fragment/buttonPrimary.dart';
import 'package:kampungku/fragment/customdropdown.dart';
import 'package:kampungku/fragment/loaderColor.dart';
import 'package:kampungku/fragment/menu.dart';
import 'package:kampungku/fragment/terkirim.dart';
import 'package:kampungku/model/aduan/aduanmodel.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/presenter/aduan_presenter.dart';
import 'package:kampungku/utils/apiresponse.dart';
import 'package:kampungku/utils/clipperbottom.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:kampungku/view/aduan/aduanview.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:path/path.dart';



class FormAduan extends StatefulWidget {

   Aduan aduan;

  FormAduan({Key key, this.aduan}) : super(key: key);

  @override
  _FormAduanState createState() => _FormAduanState(aduan);
}

class _FormAduanState extends State<FormAduan> implements Aduanview{



  AduanModel _aduanModel;
  Aduanservicebloc _aduanservicebloc = new Aduanservicebloc();
  AduanPresenter _aduanPresenter = new AduanPresenter();
  FocusNode contentFocus;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   Aduan _aduan;


  _FormAduanState(Aduan data){
    this._aduan = data;

  }
  //init state awal
  @override
  void initState() {
    this._aduanPresenter.view = this;
    this._aduanPresenter.serviceBloc = this._aduanservicebloc;
    this._aduanPresenter.listInstansi();
    this._aduanPresenter.listKategori();
    contentFocus = new FocusNode();
    super.initState();

    if(widget.aduan != null){
      this._aduanModel.content.text = "${widget.aduan.cONTENT}";
      this._aduanModel.valueKategori = widget.aduan.jENISPENGADUAN;
      this._aduanModel.valueInstansi = widget.aduan.tUJUAN;
      this._aduanModel.Kategori = new RootipModel(widget.aduan.iDJENISPENGADUAN, widget.aduan.jENISPENGADUAN, null, null);
      this._aduanModel.Instansi = new RootipModel("${widget.aduan.iDTUJUAN} - ${widget.aduan.fLAG}", widget.aduan.tUJUAN, null, null);
      widget.aduan.lAMPIRAN.forEach((e){
        this._aduanModel.itemBox.file = File(e.uRL);
        this._aduanModel.itemBox.Filename = e.lAMPIRAN;
        this._aduanModel.itemBox.id = e.iDLAMPIRAN;
        this._aduanModel.itemFiles.add(this._aduanModel.itemBox);
      });
      this._aduanModel.iD = widget.aduan.iDPENGADUAN;
    }
  }

  //saat object hilang
  @override
  void dispose() {
    this._aduanservicebloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      body: SafeArea(
        child: NestedScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(onPressed: ()=>_scaffoldKey.currentState.openDrawer(), icon: Icon(LineIcons.bars,color: Colors.white,size: 30,),iconSize: 30,color: Colors.white,),
                flexibleSpace: Container(
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
              )
            ];
          },
          body: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child:
                ClipPath(
                  clipper: ClipperBottom(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 320.0,
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
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/images/bottom-circle.png"),
              ),
              Positioned.fill(
                child: LayoutBuilder(
                    builder: (context, constraint) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraint.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                                Expanded(
                                    child: this._aduanModel.loadingsent
                                        ? Center(child: LoaderColor(),)
                                        : this._aduanModel.Isent ? Terkirim() :Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.transparent,
                                      child: SingleChildScrollView(
                                        physics: ClampingScrollPhysics(),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
//                                                boxShadow:[
//                                                  BoxShadow(
//                                                      blurRadius: 6,
////                    offset: Offset(15,
//                                                      color: Color(0xffdddddd).withOpacity(.6),
//                                                      spreadRadius: 2
//                                                  )
//                                                ]
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text("Buat Laporan ",
                                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                                      ),
                                                    ),
                                                    OutlineButton.icon(
                                                      onPressed: () {Navigator.pushNamed(context, '/history');},
                                                      icon: Icon(Icons.history,),
                                                      label: Text("History"),
//                        child: Text("Follow"),
                                                      borderSide: BorderSide(color: Colors.blue),
                                                      shape: StadiumBorder(),
                                                      splashColor: ColorApp.primaryaccent,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Divider(height: 1),
                                                SizedBox(height: 20,),
                                                TextField(
                                                  decoration: InputDecoration(
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                                      borderSide: BorderSide(width: 0.5,color: ColorApp.primaryaccent),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                                      borderSide: BorderSide(width: 0.5,color: ColorApp.primaryaccent),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                                        borderSide: BorderSide(width: 0.5,)
                                                    ),
                                                    hintText: "Ketik Laporan Anda ...",
                                                    hintStyle: TextStyle(fontSize: 16,color: Color(0xFFB3B1B1)),
                                                  ),
                                                  maxLines: 8,
                                                  controller: this._aduanModel.content,
                                                  focusNode: contentFocus,

                                                ),
                                                SizedBox(height: 20,),
                                                StreamBuilder<ApiResponse<List<RootipModel>>>(
                                                    stream: this._aduanservicebloc.kategoriStream,
                                                    builder: (context, snapshot) {
                                                      if(snapshot.data == null){
                                                        return SkeletonAnimation(
                                                          shimmerColor: Colors.grey,
                                                          child: Container(
                                                            height: 48,
                                                            width: MediaQuery.of(context).size.width,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(3),
                                                              border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
                                                            ),
                                                          ),
                                                        );
                                                      }else{
                                                        switch(snapshot.data.status){
                                                          case Status.LOADING:
                                                            return SkeletonAnimation(
                                                              shimmerColor: Colors.grey,
                                                              child: Container(
                                                                height: 48,
                                                                width: MediaQuery.of(context).size.width,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(3),
                                                                  border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
                                                                ),
                                                              ),
                                                            );
                                                            break;
                                                          case Status.COMPLETED:
                                                            return RootipDrowpdown(
                                                              height: 48,
                                                              width: MediaQuery.of(context).size.width,
                                                              borderColor: ColorApp.primaryaccent,
                                                              fillColor: Colors.white,
                                                              hinttext: "Pilih Kategori",
                                                              iconRight: Icon(Icons.arrow_drop_down,color: ColorApp.primary,size: 30,),
                                                              showborder: true,
                                                              value: this._aduanModel.valueKategori,
                                                              calldata: (RootipModel data){
                                                                setState(() {
                                                                  FocusScope.of(context).requestFocus(new FocusNode());
                                                                  this._aduanModel.valueKategori = "${data.label}";
                                                                  this._aduanModel.Kategori = data;
                                                                });
                                                              },
                                                              data: snapshot.data.data,
                                                            );
                                                            break;
                                                          case Status.ERROR:
                                                            return Text('Error: ${snapshot.error}');
                                                            break;
                                                          default:
                                                            return Text('Handle no data page');
                                                        }
                                                      }
                                                    }
                                                ),
                                                SizedBox(height: 20,),
                                                StreamBuilder<ApiResponse<List<RootipModel>>>(
                                                    stream: this._aduanservicebloc.instansiStream,
                                                    builder: (context, snapshot) {
                                                      if(snapshot.data == null){
                                                        return SkeletonAnimation(
                                                          child: Container(
                                                            height: 48,
                                                            width: MediaQuery.of(context).size.width,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(3),
                                                              border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
                                                            ),
                                                          ),
                                                        );
                                                      }else{
                                                        switch(snapshot.data.status){
                                                          case Status.LOADING:
                                                            return SkeletonAnimation(
                                                              child: Container(
                                                                height: 48,
                                                                width: MediaQuery.of(context).size.width,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(3),
                                                                  border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
                                                                ),
                                                              ),
                                                            );
                                                            break;
                                                          case Status.COMPLETED:
                                                            return RootipDrowpdown(
                                                              height: 48,
                                                              width: MediaQuery.of(context).size.width,
                                                              borderColor: ColorApp.primaryaccent,
                                                              fillColor: Colors.white,
                                                              hinttext: "Pilih Instansi Tujuan",
                                                              iconRight: Icon(Icons.arrow_drop_down,color: ColorApp.primary,size: 30,),
                                                              showborder: true,
                                                              value: this._aduanModel.valueInstansi,
                                                              calldata: (RootipModel data){
                                                                setState(() {
                                                                  FocusScope.of(context).requestFocus(new FocusNode());
                                                                  this._aduanModel.valueInstansi = "${data.label}";
                                                                  this._aduanModel.Instansi = data;
                                                                });
                                                              },
                                                              data: snapshot.data.data,
                                                            );
                                                            break;
                                                          case Status.ERROR:
                                                            return Text('Error: ${snapshot.error}');
                                                            break;
                                                          default:
                                                            return Text('Handle no data page');
                                                        }
                                                      }
                                                    }
                                                ),
                                                SizedBox(height: 20,),
                                                Visibility(
                                                  visible: this._aduanModel.itemFiles.length > 0,
                                                  child:BoxMultiUpload(data: this._aduanModel.itemFiles,aduanPresenter: this._aduanPresenter,),
                                                ),
                                                SizedBox(height: 20,),
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Visibility(
                                                      visible: this._aduanModel.itemFiles.length < 2,
                                                      child: ButtonPrimary(
                                                        height: 40,
//                      width: 80,
                                                        icon: Icon(Icons.attachment,color: ColorApp.primary,),
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              Colors.grey,
                                                              Colors.grey.withOpacity(0.6)
                                                            ]
                                                        ),
                                                        text: "Attach File",
                                                        ontap: ()=>this._aduanPresenter.attachClicked(),
                                                      ),
                                                    ),
                                                    ButtonPrimary(
                                                      height: 40,
//                      width: 80,
                                                      icon: Icon(Icons.send,color: Colors.white,),
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            ColorApp.primaryaccent,
                                                            ColorApp.primary
                                                          ]
                                                      ),
                                                      text: "Send Laporan",
                                                      ontap: ()=>this._aduanPresenter.send(),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 20,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onError(String error) {
    print("$error");
  }

  @override
  void onSuccess(String success) {
    print("$success");
  }

  @override
  void refreshData(AduanModel aduanModel) {
    setState(() {
      this._aduanModel = aduanModel;
    });
  }


  @override
  void showOption(BuildContext context, Aduan aduan,AduanPresenter presenter) {
    // TODO: implement showOption
  }
}
