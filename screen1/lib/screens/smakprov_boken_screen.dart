import 'package:flutter/material.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SmakprovbokenScreen extends StatefulWidget {
  @override
  _SmakprovbokenScreenState createState() => _SmakprovbokenScreenState();
}

class _SmakprovbokenScreenState extends State<SmakprovbokenScreen> {
  String dpfAssets = "assets/pdf/Hjarnfokus_Johan_Bergstaf.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff50B6C7),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'SMAKPROV BOKEN',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'Roboto-Meidum'),
        ),
      ),
      body: SafeArea(child: SfPdfViewer.asset(dpfAssets)),
      endDrawer: EndDrawerScreen(),
    );
  }
}
