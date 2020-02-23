
import 'dart:async';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kampungku/fragment/btextfield.dart';
import 'package:kampungku/fragment/cardlisthistory.dart';
import 'package:kampungku/fragment/empty.dart';
import 'package:kampungku/fragment/loaderColor.dart';
import 'package:kampungku/model/aduan/aduanmodel.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/parent/aduanprovider.dart';
import 'package:kampungku/parent/provider.dart';
import 'package:kampungku/parent/userprovider.dart';
import 'package:kampungku/presenter/aduan_presenter.dart';
import 'package:kampungku/utils/colorapp.dart';


class HistoryScreen extends StatefulWidget {
  final Widget child;
  HistoryScreen({this.child, Key key})
      : super(
    key: key,
  );
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> with SingleTickerProviderStateMixin  {

  TabController tabController;
  ScrollController _appbarscroll;
  bool LoadingData = true;
  List<Aduan> Myhistory = new List<Aduan>();
  List<Aduan> MyAllhistory = new List<Aduan>();
  AduanModel _aduanModel;
  AduanPresenter _aduanPresenter;

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    tabController = new TabController(length: 4, vsync: this);
    _appbarscroll = ScrollController();
//    subcribe.
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


  }


  void SelectedTab(int a){
    setState(() {
      tabController.index = a;
      this.Myhistory = this.MyAllhistory.where((i)=>
      i.sTATUS == getTabFilter(tabController.index)
      ).toList();
    });
  }

  String getTabFilter(int i){
    switch (i){
      case 0:
        return "0";
        break;
      case 1:
        return "1";
      case 2:
        return "2";
      case 3:
        return "4";
      default:
        return "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    this._aduanModel = Provider.of(context).value;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text("${this._aduanModel.valueInstansi}")),
      ),
    );
//    return Scaffold(
//      body: SafeArea(
//        child: NestedScrollView(
//          scrollDirection: Axis.vertical,
//          physics: ClampingScrollPhysics(),
//          headerSliverBuilder:  (BuildContext context, bool innerBooxScrolled){
//            return <Widget>[
//              SliverAppBar(
//                pinned: true,
//                elevation: 2,
//                snap: true,
//                backgroundColor: Color(0xff007bff),
//                expandedHeight: 70,
//                floating: true,
//                actions: <Widget>[
//                  Icon(Icons.notifications,color: Colors.white,),
//                  SizedBox(width: 20,)
//                ],
//                flexibleSpace: FlexibleSpaceBar(
//                  collapseMode: CollapseMode.pin,
//                  background: Container(
//                    decoration: BoxDecoration(
//                      gradient: LinearGradient(
//                        colors: [
//                          Color(0xff007bff),
//                          Color(0xff036cef)
//                        ]
//                      )
//                    ),
//                    padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 0),
//                  ),
//                ),
//              ),
//            ];
//          },
//          body: SingleChildScrollView(
//            physics: ClampingScrollPhysics(),
//            scrollDirection: Axis.vertical,
//            child: Container(
//              height: MediaQuery.of(context).size.height,
//              width: MediaQuery.of(context).size.width,
//              padding: EdgeInsets.only(top: 2),
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                      colors: [
//                        Color(0xff007bff),
//                        Color(0xff036cef)
//                      ]
//                  )
//              ),
//              child: Container(
//                height: MediaQuery.of(context).size.height,
//                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.black.withOpacity(0.2),
//                      blurRadius: 2, // has the effect of softening the shadow
//                      spreadRadius: 1,
//                    )
//                    ]
//                ),
//                padding: EdgeInsets.all(10),
//                child: Column(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(left: 20,top: 10,bottom: 8),
//                      child: Text("History ",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 24),),
//                    ),
//                    BTextfield(
//                        width: MediaQuery.of(context).size.width,
//                        height: 40,
//                        prefixIcon: Icon(Icons.search,size: 16,),
//                        inputType: TextInputType.text,
//                      placeholder: "Cari History",
//                      backgroundColor: Colors.grey,
//                    ),
//                    Container(
//                      width: MediaQuery.of(context).size.width,
//                      height: 60,
//                      child: TabBar(
//                        isScrollable: true,
//                        controller: tabController,
//                        indicatorColor: Colors.transparent,
//                        labelColor: Colors.white,
//                        labelStyle: TextStyle(color: Colors.white),
//                        unselectedLabelColor: Colors.white,
//                        onTap: SelectedTab,
//                        labelPadding: EdgeInsets.symmetric(horizontal: 3.0),
//                        tabs: <Widget>[
//                          Container(
//                            height: 32,
//                            padding: EdgeInsets.only(left: 8,right: 8),
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15),
//                                color:  tabController.index == 0 ? ColorApp.primary : ColorApp.primaryaccent
//                            ),
//                            child: Tab(text: "Menunggu Verifikasi",),
//                          ),
//                          Container(
//                            height: 32,
//                            padding: EdgeInsets.only(left: 8,right: 8),
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15),
//                              color:  tabController.index == 1 ? ColorApp.primary : ColorApp.primaryaccent
//                            ),
//                            child: Tab(text: "Sedang Di Proses",),
//                          ),
//                          Container(
//                            height: 32,
//                            padding: EdgeInsets.only(left: 8,right: 8),
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15),
//                                color:  tabController.index == 2 ? ColorApp.primary : ColorApp.primaryaccent
//                            ),
//                            child: Tab(text: "Sudah Selesai",),
//                          ),
//                          Container(
//                            height: 32,
//                            padding: EdgeInsets.only(left: 8,right: 8),
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(15),
//                                color:  tabController.index == 3 ? ColorApp.primary : ColorApp.primaryaccent
//                            ),
//                            child: Tab(text: "Ditolak",),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Expanded(
//                      child: this.LoadingData
//                          ? Center(child: LoaderColor(),)
//                          : this.Myhistory.length > 0 ? ListView.builder(
//                        itemCount: this.Myhistory.length,
//                        shrinkWrap: true,
//                        physics: ClampingScrollPhysics(),
//                        scrollDirection: Axis.vertical,
//                        itemBuilder: (context,i){
//                            return CardListHistory(aduan: this.Myhistory[i],callback: (Aduan data){
//                              print(data.iDPENGADUAN);
//                            },);
//                        },
//                      ) : Empty(errtext: "Tidak ada data",)
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
