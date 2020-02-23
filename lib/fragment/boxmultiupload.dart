import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/presenter/aduan_presenter.dart';
import 'package:kampungku/utils/colorapp.dart';

class BoxMultiUploadItem{
  String id;
  File file;
  String Filename;
}




class BoxMultiUpload extends StatefulWidget {

  List<BoxMultiUploadItem> data;
  AduanPresenter aduanPresenter;
  BoxMultiUpload({Key key, this.data,this.aduanPresenter}) : super(key: key);

  @override
  _BoxMultiUploadState createState() => _BoxMultiUploadState();
}

class _BoxMultiUploadState extends State<BoxMultiUpload> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
//        border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
      ),
      child:Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              itemCount: widget.data.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: EdgeInsets.all(8),
              itemBuilder: (ctx,i){
                return InkWell(
                  onLongPress: ()=>this.Confirm(i),
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
                    ),
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.insert_drive_file,color: ColorApp.primaryaccent,size: 50,),
                       Center(child:  AutoSizeText(widget.data[i].Filename,softWrap: true,maxLines: 1,maxFontSize: 11,minFontSize: 9,),)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text("Max 2 file for upload",style: TextStyle(fontSize: 11,color: Colors.grey,fontStyle: FontStyle.italic),)
        ],
      ),
    );
  }




  // ignore: non_constant_identifier_names
  void Confirm(int index){
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
                  "anda yakin akan menghapus file ini?",
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
                  this.widget.aduanPresenter.removeFile(index);
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}
