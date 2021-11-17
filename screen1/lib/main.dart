import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/splash_screen.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.orange));
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
                  
