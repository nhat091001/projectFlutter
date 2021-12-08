import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screen1/screens/luutru.dart';
import './screens/splash_screen.dart';
import 'package:screen1/screens/ovningar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(NoteAdapter());
  await Hive.openBox("friends");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      title: 'test1',
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

// Text(
//   '',
//   style: kTextStyleOH,
// ),
// SizedBox(
//   height: 20,
// ),
// Text(
//   '',
//   style: kTextStyleOH,
// ),
// SizedBox(
//   height: 20,
// ),
// Text(
//   '',
//   style: kTextStyleOH,
// ),
// SizedBox(
//   height: 20,
// ),
// Text(
//   '  ',
//   style: kTextStyleOH,
// ),
// SizedBox(
//   height: 20,
// ),
// Text(
//   '',
//   style: kTextStyleOH,
// ),
// Text(
//   '',
//   style: kTextStyleOH,
// ),
// SizedBox(
//   height: 20,
// ),
// Text(
//   '',
//   style: kTextStyleOH,
// ),
// SizedBox(
//   height: 20,
// ),
// Text(
//   '',
//   style: kTextStyleOH,
// ),
