import 'package:flutter/material.dart';
import 'package:screen1/models/ovningar_list_model.dart';
import 'package:screen1/screens/min_profil_screen.dart';
import 'package:screen1/screens/omhjarnfokus_screen.dart';
import 'package:screen1/screens/ovningar.dart';
import 'package:screen1/screens/paminelser_screen.dart';
import 'package:screen1/screens/smakprov_boken_screen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        backgroundColor: Color(0xff3EAFC1),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 245,
              width: 246,
              child: DrawerHeader(
                child: Container(
                  child: Image.asset(
                    'assets/images/logo2x.png',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text(
                        'ÖVNINGAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OvningarScreen()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'OM HJÄRNFOKUS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OmHjarnFokusScreen()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'SMAKPROV BOKEN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SmakprovbokenScreen()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'PÅMINNELSER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaminelserScreen()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'MIN PROFIL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MinProfilScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
