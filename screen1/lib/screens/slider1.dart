import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';


class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  final baseColor = Color.fromRGBO(255, 255, 255, 0.3);

  late int initTime;
  late int endTime;

  late int inBedTime;
  late int outBedTime;
  int days = 0;

  @override
  void initState() {
    super.initState();
    _shuffle();
  }

  void _shuffle() {
    setState(() {
      initTime = _generateRandomTime();
      endTime = _generateRandomTime();
      inBedTime = initTime;
      outBedTime = endTime;
    });
  }

  void _updateLabels(int init, int end, int laps) {
    setState(() {
      inBedTime = init;
      outBedTime = end;
      days = laps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3EAFC1),
      body: Container(
        margin: EdgeInsets.fromLTRB(75, 0, 0, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SingleCircularSlider(
              288,
              endTime,
              height: 220.0,
              width: 220.0,
              baseColor: Color.fromRGBO(255, 255, 255, 0.1),
              handlerColor: Colors.orange,
              handlerOutterRadius: 22.0,
              onSelectionChange: _updateLabels,
              showRoundedCapInSelection: true,
              showHandlerOutter: false,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text('${_formatIntervalTime(inBedTime, outBedTime)}',
                          style: TextStyle(fontSize: 50.0, color: Colors.white)),

                    ],
                  )),
              shouldCountLaps: true,
            ),


          ],
        ),
      ),
    );
  }





  String _formatIntervalTime(int init, int end) {
    var sleepTime = end > init ? end - init : 288 - init + end;
    var minutes = sleepTime ~/ 12;
    var seconds = (sleepTime % 12) * 5;
    return '${minutes}:${seconds}';
  }

  int _generateRandomTime() => Random().nextInt(288);
}