


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootipModel{
  final String id;
  final String label;
  final Image image;
  final Icon icon;

  RootipModel(this.id, this.label, this.image, this.icon);
}



class RootipDrowpdown extends StatelessWidget {

  final double width;
  final double height;
  final bool showborder;
  final Color borderColor;
  final Color focusBorderColor;
  final Color fillColor;
  final String hinttext;
  final Icon iconRight;
  final Icon iconLeft;
  final List<RootipModel> data;
  final void Function(RootipModel) calldata;
  String value;
   RootipDrowpdown({Key key, this.width, this.height, this.borderColor, this.focusBorderColor, this.hinttext, this.iconRight, this.iconLeft, this.fillColor, this.showborder, this.calldata, this.data, this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: ()=>{tampilDialog(context)},
        child: Container(
          width:width,
          height: height,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: showborder ? borderColor : Colors.transparent,width: 0.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(value != '-' ? value : hinttext,style: TextStyle(fontSize: 12,color: Colors.black45),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: iconRight,
              ),
            ],
          ),
        ),
      );
  }


  tampilDialog(BuildContext context) async{
    FixedExtentScrollController controller = new FixedExtentScrollController();
    await showGeneralDialog(
      context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context,Animation animation,
            Animation secondaryAnimation){
        return Center(
          child: Container(
            color: Colors.white.withOpacity(0.9),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 40,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FlatButton.icon( onPressed: ()=>{Navigator.pop(context)} ,icon: Icon(Icons.close), label: Text("cancel")),
                      FlatButton.icon( onPressed: (){
                        int index = controller.selectedItem;
                        calldata(data[index]);
                        value = data[index].label;
                        Navigator.pop(context);
                      } ,icon: Icon(Icons.check), label: Text("ok"))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 160,
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: CupertinoPicker.builder(
                    scrollController: controller,
                    offAxisFraction: 0.0,
                    itemExtent: 40,
                    childCount: data.length,
                    useMagnifier: true,
                    magnification: 1.25,
                    diameterRatio: 3.0,
                    backgroundColor: Colors.transparent,
                    onSelectedItemChanged: (index){
                      if(index != null){
                        calldata(data[index]);
                        value = data[index].label;
                      }
                    },
                    itemBuilder: (context,i){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
//                            Icon(Icons.label),
//                            SizedBox(width: 15,),
                            Center(child: Text("${data[i].label}",style: TextStyle(fontSize: 18,color: Colors.black),)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ),
        );
      }
    );
  }




}
