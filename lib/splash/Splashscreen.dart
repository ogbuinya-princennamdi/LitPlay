import 'dart:async';

import 'package:flutter/material.dart';
import 'package:litplay/splash/loadLogo.dart';

import '../Dashboard/Dashboard.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}


class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    _navigateToDashboard();
  }
  _navigateToDashboard(){
    Timer( const Duration(seconds: 5),
        (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> const Dashboard()),
      );
        });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(24, 255, 146, 154),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             loadLogo(),
           ],

         ),
       ),
    );
  }
}
