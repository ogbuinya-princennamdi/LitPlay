import 'package:flutter/material.dart';
import 'CustomAppBar.dart';
import 'CustomBottomNavigationBar.dart';
import 'Home.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: Customappbar(),
      body: Home(),
      bottomNavigationBar: Custombottomnavigationbar(),
    );
  }
}

