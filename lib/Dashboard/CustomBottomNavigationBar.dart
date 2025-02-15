import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litplay/BottomFiles/OffilineVideos.dart';
import 'package:litplay/Dashboard/Dashboard.dart';

import '../BottomFiles/LocalVideo.dart';
import '../BottomFiles/SavedVideo.dart';
import '../BottomFiles/ShareVideo.dart';
class Custombottomnavigationbar extends StatefulWidget {
  const Custombottomnavigationbar({super.key});

  @override
  State<Custombottomnavigationbar> createState() => _CustombottomnavigationbarState();
}

class _CustombottomnavigationbarState extends State<Custombottomnavigationbar> {
  int _selectedIndex= 2;
  @override
  Widget build(BuildContext context) {

    return   BottomNavigationBar(

      items:  <BottomNavigationBarItem>[
        const BottomNavigationBarItem(icon: Icon(Icons.file_open_outlined, color: Colors.red,weight: 24,),label: "File"),
        const BottomNavigationBarItem(icon: Icon(Icons.download_for_offline_outlined, color: Colors.red,weight: 20,), label: "offline"),
        BottomNavigationBarItem(icon: Transform.translate(
          offset: Offset(0, -4),
          child: Container(
            width: 50,
            height: 50,
            decoration:  BoxDecoration(
              color: Colors.red,

              borderRadius: BorderRadius.circular(50),
            ),
              child: Icon(Icons.home,)),
        ), label: "",),
        const BottomNavigationBarItem(icon: Icon(Icons.share,color: Colors.red,weight: 20,), label: "Share"),
        const BottomNavigationBarItem(icon: Icon(Icons.save,color: Colors.red,weight: 20,),label: "Saved"),
      ],
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 30,
      selectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      onTap: _onItemTapped,
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex= index;
      Widget page= const Dashboard();
      switch (index){
        case 0: page= const LocalVideo();
        break;
        case 1: page= const OffilineVideos();
        break;
        case 2: page= const Dashboard();
        case 3: page = const ShareVideo();
        break;
        case 4: page= const SavedVideo();
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => page),
          (Route<dynamic> route)=> false,
      );
    });
  }
}

