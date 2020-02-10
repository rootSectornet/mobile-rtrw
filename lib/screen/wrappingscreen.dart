
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:kampungku/screen/event/event.dart';
import 'package:kampungku/screen/aduan/aduan.dart';
import 'package:kampungku/screen/profile/profile.dart';
import 'package:kampungku/screen/sarana/sarana.dart';
class WrappingScreen extends StatefulWidget {
  @override
  _WrappingScreenState createState() => _WrappingScreenState();
}

class _WrappingScreenState extends State<WrappingScreen> {

  int _selectedIndex = 0;
  var currentTab = [
    Event(),
    Sarana(),
    Aduan()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: currentTab[_selectedIndex],
      bottomNavigationBar:BottomNavyBar(
        backgroundColor: Colors.white,
        selectedIndex : _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.event_note),
            title: Text('Acara & Kegiatan'),
            activeColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.extension),
            title: Text('Sarana & Prasarana'),
            activeColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.send),
              title: Text('Aduan'),
              activeColor: Colors.blueAccent
          ),
        ],
      ),
    );
  }
}