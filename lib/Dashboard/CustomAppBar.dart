import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../YoutubeFiles/VideoSearchDelegate.dart';
import '../YoutubeFiles/Youtubeservices.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
   const Customappbar ({super.key});
  @override
  Widget build(BuildContext context) {
    Youtubeservices _youtubeservices= Youtubeservices.instance;
    return  AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CupertinoColors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset("assets/Litplay.png",
          width: 120,
          height: 90,),
        ),

        const Spacer(),
        InkWell(
        onTap: () async {
    },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.screen_share_outlined, size: 30,color: Colors.red,weight: 20,),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.notifications_none, size: 30,color: Colors.red,weight: 20,),
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            onPressed: (){
              showSearch(context: context,
                  delegate: VideoSearchDelegate(_youtubeservices),
              );
            },
            icon: Icon(Icons.search, size:30,color: Colors.red,weight: 20,),
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(60);
}
