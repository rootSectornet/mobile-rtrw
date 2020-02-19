
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/fragment/circleimage.dart';
import 'package:kampungku/model/user/userresponse.dart';
import 'package:kampungku/parent/userprovider.dart';
import 'package:kampungku/screen/event/event.dart';
import 'package:kampungku/screen/aduan/aduan.dart';
import 'package:kampungku/screen/profile/profile.dart';
import 'package:kampungku/screen/sarana/sarana.dart';
import 'package:kampungku/utils/apppath.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
class WrappingScreen extends StatefulWidget {
  final Widget child;
  WrappingScreen({this.child, Key key})
      : super(
    key: key,
  );
  @override
  _WrappingScreenState createState() => _WrappingScreenState();
}

class _WrappingScreenState extends State<WrappingScreen> with SingleTickerProviderStateMixin{


  TabController tabController;
  User _user = new User();
  @override
  void initState() {
    // TODO: implement initState
    tabController = new TabController(length: 3, vsync: this);
    AppPath.getIdUser().then((a)=>this._user.nIKWARGA=a);
    AppPath.getNamaUser().then((a)=>_user.nAMAWARGA=a);
    AppPath.getFotoUser().then((a)=>_user.fOTO=a);
    AppPath.getNoTlp().then((a)=>_user.nOTELP=a);
    AppPath.getRt().then((a)=>_user.rT=a);
    AppPath.getRw().then((a)=>_user.rW=a);
    AppPath.getKelurahan().then((a)=>_user.kELURAHAN=a);
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
    return UserProvider(
      nama: "tedi",
      user: this._user,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title : Text("Kampungku",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none),

            )
          ],
        ),
        body: SafeArea(
          child: NestedScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBooxScrolled){
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  elevation: 2,
                  backgroundColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48.0),
                    child: Container(
                      height: 48.0,
                      alignment: Alignment.center,
                      child:
                      TabBar(
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
                  ),
                  expandedHeight: 150,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/usr.jpg",),
                              radius: 25,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text("${this._user.nAMAWARGA}",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700),),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text("${this._user.nOTELP}",style: TextStyle(fontSize: 12,color: Colors.grey,)),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text("Warga Rt ${this._user.rT}/${this._user.rW} ${this._user.kELURAHAN}",style: TextStyle(fontSize: 12,color: Colors.grey,)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body:
            TabBarView(
              controller: tabController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Event(),
                Sarana(),
                Aduan()
              ],
            ),
          ),
        ),

      ),
    );
  }
}