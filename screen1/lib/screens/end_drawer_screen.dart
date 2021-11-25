import 'package:flutter/material.dart';
import 'package:screen1/models/ovningar_list_model.dart';
import 'package:screen1/onbroading/onbroading_screen.dart';
import 'package:screen1/screens/media_music_screen.dart';
import 'package:screen1/screens/min_profil_screen.dart';
import 'package:screen1/screens/omhjarnfokus_screen.dart';
import 'package:screen1/screens/ovningar.dart';
import 'package:screen1/screens/paminelser_screen.dart';
import 'package:screen1/screens/register2_screen.dart';
import 'package:screen1/screens/register_screen.dart';
import 'package:screen1/screens/smakprov_boken_screen.dart';
import 'package:screen1/screens/splash_screen.dart';
import '../models/item_index.dart';
import '../dafaults/defaults.dart';

class EndDrawerScreen extends StatefulWidget {
  @override
  _EndDrawerScreenState createState() => _EndDrawerScreenState();
}

int indexClicked = 0;

class _EndDrawerScreenState extends State<EndDrawerScreen> {
  final pages = [
    Center(
      child: Text('ÖVNINGAR'),
    ),
    Center(
      child: Text('OM HJÄRNFOKUS'),
    ),
    Center(
      child: Text('SMAKPROV BOKEN'),
    ),
    Center(
      child: Text('PÅMINNELSER'),
    ),
    Center(
      child: Text('LOGG'),
    ),
    Center(
      child: Text('MIN PROFIL'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
      color: Color(0xFF3EAFC1),
      child: Column(
        children: [
          Container(
            height: 200,
            child: Image.asset('assets/images/logo2x.png'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 11, 0, 0),
            height: 450,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Column(
                    children: [
                      Divider(),
                      AppDrawerTile(
                        index: 0,
                        onTap: () {
                          setState(() {
                            indexClicked = 0;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OvningarScreen()));
                        },
                      ),
                      Divider(),
                      AppDrawerTile(
                        index: 1,
                        onTap: () {
                          setState(() {
                            indexClicked = 1;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OmHjarnFokusScreen()));
                        },
                      ),
                      Divider(),
                      AppDrawerTile(
                        index: 2,
                        onTap: () {
                          setState(() {
                            indexClicked = 2;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SmakprovbokenScreen()));
                        },
                      ),
                      Divider(),
                      AppDrawerTile(
                        index: 3,
                        onTap: () {
                          setState(() {
                            indexClicked = 3;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaminelserScreen()));
                        },
                      ),
                      Divider(
                        height: 0,
                      ),
                      AppDrawerTile(
                        index: 4,
                        onTap: () {
                          setState(() {
                            indexClicked = 4;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                      ),
                      Divider(),
                      AppDrawerTile(
                        index: 5,
                        onTap: () {
                          setState(() {
                            indexClicked = 5;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen2()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({Key? key, required this.index, required this.onTap})
      : super(key: key);

  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Center(
        child: Text(
          Defaults.drawerItemText[index],
          style: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: 15,
              color: indexClicked == index ? Colors.yellow : Colors.black),
        ),
      ),
    );
  }
}
