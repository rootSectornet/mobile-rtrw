import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kampungku/blocservice/aduanblocservice.dart';
import 'package:kampungku/fragment/cardlisthistory.dart';
import 'package:kampungku/fragment/empty.dart';
import 'package:kampungku/fragment/menu.dart';
import 'package:kampungku/fragment/optionhistory.dart';
import 'package:kampungku/loading/loadingsarana.dart';
import 'package:kampungku/model/aduan/aduanmodel.dart';
import 'package:kampungku/model/aduan/history.dart';
import 'package:kampungku/presenter/aduan_presenter.dart';
import 'package:kampungku/utils/clipperbottom.dart';
import 'package:kampungku/utils/colorapp.dart';
import 'package:kampungku/view/aduan/aduanview.dart';
import 'package:line_icons/line_icons.dart';


class Historyscreen extends StatefulWidget {
  @override
  _HistoryscreenState createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> with SingleTickerProviderStateMixin  implements Aduanview {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // define atribute

  AduanModel _aduanModel;
  Aduanservicebloc _aduanservicebloc = new Aduanservicebloc();
  AduanPresenter _aduanPresenter = new AduanPresenter();

  // constructor
  _HistoryscreenState(){
    this._aduanPresenter = new AduanPresenter();
  }

  //init state awal
  @override
  void initState() {
    this._aduanPresenter.view = this;
    this._aduanPresenter.serviceBloc = this._aduanservicebloc;
    this._aduanModel.tabController = new TabController(length: 4, vsync: this);
    this._aduanPresenter.getData();
    super.initState();
  }

  //saat object hilang
  @override
  void dispose() {
    this._aduanservicebloc.dispose();
    super.dispose();
  }

  void SelectedTab(int a){
    setState(() {
      this._aduanModel.tabController.index = a;
      this._aduanModel.Myhistory = this._aduanModel.MyAllhistory.where((i)=>
      i.sTATUS == this._aduanPresenter.getTabFilter(this._aduanModel.tabController.index)
      ).toList();
    });
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
                        return RefreshIndicator(
                          onRefresh: ()=>this._aduanPresenter.refresh(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: constraint.maxHeight),
                            child: IntrinsicHeight(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
//                              height: 110,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(top: 5,left: 18,right: 18,bottom: 3),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text("Laporan",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10,),
                                        Container(
                                            height: 40,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Color(0xfff5f5f5)
                                            ),
                                            padding: EdgeInsets.only(left: 8,right: 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(FontAwesomeIcons.search,color: Colors.black,size: 16,),
                                                SizedBox(width: 10,),
                                                Container(
                                                  width: MediaQuery.of(context).size.width / 1.5,
                                                  height: 40,
                                                  child: TextFormField(
                                                    expands: true,
                                                    maxLines: null,
                                                    minLines: null,
                                                    style: TextStyle(color: Colors.black,fontSize: 12),
                                                    decoration: InputDecoration(
                                                        hintText:"cari history laporanmu",
                                                        border: InputBorder.none,
                                                        fillColor: Colors.black,
                                                        hintStyle:  TextStyle(color: Colors.black54,fontSize: 12)
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Icon(Icons.filter_list,size: 16,),
                                                  ),
                                                )
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: TabBar(
                                      isScrollable: true,
                                      controller: this._aduanModel.tabController,
                                      indicatorColor: Colors.transparent,
                                      labelColor: Colors.white,
                                      labelStyle: TextStyle(color: Colors.white),
                                      unselectedLabelColor: Colors.white,
                                      onTap: SelectedTab,
                                      labelPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                      tabs: <Widget>[
                                        Container(
                                          height: 32,
                                          padding: EdgeInsets.only(left: 8,right: 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                              color:  this._aduanModel.tabController.index == 0 ? ColorApp.primary : ColorApp.primaryaccent
                                          ),
                                          child: Tab(text: "Menunggu Verifikasi",),
                                        ),
                                        Container(
                                          height: 32,
                                          padding: EdgeInsets.only(left: 8,right: 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color:  this._aduanModel.tabController.index == 1 ? ColorApp.primary : ColorApp.primaryaccent
                                          ),
                                          child: Tab(text: "Sedang Di Proses",),
                                        ),
                                        Container(
                                          height: 32,
                                          padding: EdgeInsets.only(left: 8,right: 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                              color:  this._aduanModel.tabController.index == 2 ? ColorApp.primary : ColorApp.primaryaccent
                                          ),
                                          child: Tab(text: "Sudah Selesai",),
                                        ),
                                        Container(
                                          height: 32,
                                          padding: EdgeInsets.only(left: 8,right: 8),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color:  this._aduanModel.tabController.index == 3 ? ColorApp.primary : ColorApp.primaryaccent
                                          ),
                                          child: Tab(text: "Ditolak",),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: this._aduanModel.loadingHistory
                                        ? LoadingSarana()
                                        : this._aduanModel.Myhistory.length > 0 ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height,
                                      padding: EdgeInsets.only(top:0,left: 10,right: 10),
                                          child: ListView.builder(
                                      itemCount: this._aduanModel.Myhistory.length,
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context,i){
                                            return CardListHistory(aduan: this._aduanModel.Myhistory[i],callback: (Aduan data){
                                              this.showOption(context,data,this._aduanPresenter);
                                            },);
                                      },
                                    ),
                                        ) : Empty(errtext: "Tidak ada data",)
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorApp.primaryaccent,
        child: Icon(LineIcons.plus,size: 16,color: Colors.white,),
        onPressed: ()=>Navigator.pushNamed(context, "/formaduan"),
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
  void showOption(BuildContext context,Aduan aduan,AduanPresenter presenter) {
    // TODO: implement showOption
    if(aduan.sTATUS == "0"){
      showBottomSheet(
          backgroundColor: Colors.transparent,
          elevation: 0,
          context: context,
          builder: (context) {
            return OptionHistory(aduan: aduan,delete: (Aduan data,Function(BuildContext) pop){
//              pop(context);
              Confirm(data.iDPENGADUAN,presenter);
            },);
          });
    }
  }


  // ignore: non_constant_identifier_names
  void Confirm(String index, AduanPresenter presenter){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Warning')),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : <Widget>[
              Expanded(
                child: Text(
                  "anda yakin akan menghapus Laporan ini?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
//                  widget.data.removeAt(index);
                  presenter.hapus(index);
                  Navigator.of(context,rootNavigator: true).pop();
                })
          ],
        );
      },
    );
  }
}


