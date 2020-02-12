
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/fragment/circleimage.dart';
import 'package:kampungku/screen/event/event.dart';
import 'package:kampungku/screen/aduan/aduan.dart';
import 'package:kampungku/screen/profile/profile.dart';
import 'package:kampungku/screen/sarana/sarana.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
class WrappingScreen extends StatefulWidget {
  @override
  _WrappingScreenState createState() => _WrappingScreenState();
}

class _WrappingScreenState extends State<WrappingScreen> with SingleTickerProviderStateMixin{


  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title : Text("Kampungku",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
          InkWell(
            child: CircleImage(AssetImage("assets/images/usr.jpg"))
          )
        ],
        bottom: TabBar(
          controller: tabController,
          labelStyle: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),
          labelColor: Colors.blueAccent,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          indicator: MD2Indicator(
            indicatorHeight: 3,
            indicatorColor: Colors.blueAccent,
            indicatorSize: MD2IndicatorSize.normal
          ),
          tabs: <Widget>[
            Tab(text: "Acara & Kegiatan",),
            Tab(text: "Sarana & Prasrana",),
            Tab(text: "Aduan / Laporan",)
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Event(),
          Sarana(),
          Aduan()
        ],
        controller: tabController,
      ),
    );
  }
}