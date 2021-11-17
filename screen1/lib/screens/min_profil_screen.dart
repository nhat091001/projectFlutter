import 'package:flutter/material.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import '../drawer_screen.dart';

class MinProfilScreen extends StatefulWidget {
  @override
  _MinProfilScreenState createState() => _MinProfilScreenState();
}

class _MinProfilScreenState extends State<MinProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MIN PROFIL'),
      ),
      body: SafeArea(
        child: Text(''),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}
