import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:math' as math;
import 'ovningar.dart';
import 'seconds_brain.dart';
import 'package:screen1/models/time_model.dart';

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

TimeModel testTime1 = TimeModel(testTime: 200);

class _ClockScreenState extends State<ClockScreen>
    with TickerProviderStateMixin {
  TextEditingController valueTime = new TextEditingController();
  late AnimationController controller;
  String? textTime;
  int? textTime1;
  String? valueMinutes;
  final items = ['1 min', '2 min', '3 min', '4 min'];
  bool isPlaying = false;
  bool isSwitched = false;
  bool isSwitched1 = false;
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: second),
    );
  }

  setSelectedRadio(int val) {
    setState(() {
      selected = val;
    });
  }

  int second = 600;
  int second0 = 60;
  int second1 = 120;
  int second2 = 180;
  int second3 = 240;
  int seconds1 = 0;
  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void changeSecond() {
    setState(() {
      if (isSwitched && valueMinutes == '1 min') {
        setState(() {
          while (seconds1 < second) {
            seconds1 = seconds1 + 60;
            Future.delayed(Duration(seconds: seconds1), () {
              _showDialog2(context);
              isSwitched
                  ? FlutterRingtonePlayer.playNotification()
                  : FlutterRingtonePlayer.stop();
            });
            print(seconds1);
          }
        });
      } else if (isSwitched && valueMinutes == '2 min') {
        setState(() {
          while (seconds1 < second) {
            seconds1 = seconds1 + 120;
            Future.delayed(Duration(seconds: seconds1), () {
              isSwitched
                  ? FlutterRingtonePlayer.playNotification()
                  : FlutterRingtonePlayer.stop();
            });
            print(seconds1);
          }
        });
      } else if (isSwitched && valueMinutes == '3 min') {
        setState(() {
          while (seconds1 < second) {
            seconds1 = seconds1 + 180;
            Future.delayed(Duration(seconds: seconds1), () {
              isSwitched
                  ? FlutterRingtonePlayer.playNotification()
                  : FlutterRingtonePlayer.stop();
            });
            print(seconds1);
          }
        });
      } else if (isSwitched && valueMinutes == '4 min') {
        setState(() {
          while (seconds1 < second) {
            seconds1 = seconds1 + 240;
            Future.delayed(Duration(seconds: seconds1), () {
              FlutterRingtonePlayer.playNotification();
            });
            print(seconds1);
          }
        });
      } else if (!isSwitched && !isSwitched1) {
        setState(() {
          //second = textTime1!;
          second = 600;
          controller.duration = Duration(seconds: second);
          print('kiểu ${textTime1.runtimeType}');
        });
      } else if (isSwitched1 && !isSwitched) {
        setState(() {
          second = textTime1!;
          controller.duration = Duration(seconds: second);
        });
      } else if (isSwitched1 && isSwitched) {
        setState(() {
          second = textTime1!;
          controller.duration = Duration(seconds: second);
        });
      } else {
        second = 600;
        controller.duration = Duration(seconds: second);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color(0xFF3EAFC1),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'HJÄRNFOKUS',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: 'Roboto-Medium'),
          ),
        ),
        leading: IconButton(
          iconSize: 20,
          color: Colors.white,
          icon: Icon(FontAwesomeIcons.chevronDown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF3EAFC1),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(60, 20, 50, 0),
          child: Column(
            children: <Widget>[
              Container(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget? child) {
                            return CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget? child) {
                                  return Column(
                                    children: [
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 40),
                                      ),
                                      Text(
                                        'Tid $timerString',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TextField(
                        controller: valueTime,
                        keyboardType: TextInputType.number,
                        onTap: () {
                          setState(() {
                            print('vừa clicked');
                          });
                        },
                        onChanged: (value) {
                          // valueTime.text = value;
                          // textTime = valueTime.text;
                          // textTime1 = int.parse(textTime!);
                          // testTime1 = TimeModel(testTime: textTime1!);
                          // print('vừa chọn ${testTime1.testTime}');
                          // // if (textTime1.runtimeType == int) {
                          // //   print('int');
                          // // } else if (textTime1.runtimeType == String) {
                          // //   print('strig');
                          // // }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.orange,
                            label: Text(
                              'Nhập thời gian',
                              style: TextStyle(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            textTime = valueTime.text;
                            textTime1 = int.parse(textTime!);

                            if (textTime1! <= 605 && textTime1! >= 0) {
                              testTime1 = TimeModel(testTime: textTime1!);
                              print('vừa chọn ${testTime1.testTime}');
                            } else if (textTime1! >= 606) {
                              setState(() {
                                textTime1 = 1000;
                                second = textTime1!;
                                _showDialog2(context);
                              });
                            }
                            // if (textTime1.runtimeType == int) {
                            //   print('int');
                            // } else if (textTime1.runtimeType == String) {
                            //   print('strig');
                            // }
                          });
                        },
                        child: Text('Chọn'),
                      ),
                    ),
                    Container(
                      child: Switch(
                        value: isSwitched1,
                        onChanged: (value) {
                          setState(() {
                            isSwitched1 = value;
                          });
                        },
                        activeTrackColor: Colors.black,
                        activeColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 100,
                      child: FlatButton(
                        color: Colors.orange,
                        height: 40,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.orange)),
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget? child) {
                            return (controller.isAnimating
                                ? Text(
                                    'STOPP',
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Medium',
                                        color: Colors.white,
                                        fontSize: 18),
                                  )
                                : Text(
                                    'START',
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Medium',
                                        color: Colors.white,
                                        fontSize: 18),
                                  ));
                          },
                        ),
                        onPressed: () {
                          setState(() => isPlaying = !isPlaying);
                          if (controller.isAnimating) {
                            controller.stop(canceled: false);
                            isSwitched = false;
                            FlutterRingtonePlayer.stop();
                          } else {
                            changeSecond();
                            controller.reverse(
                                from: controller.value == 0.0
                                    ? 1.0
                                    : controller.value);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white24,
                        border: Border.all(color: Colors.white54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Klockor varje: ',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: DropdownButton(
                              hint: Text(items.first),
                              elevation: 0,
                              dropdownColor: Colors.white70,
                              value: valueMinutes,
                              onChanged: (newValue) {
                                setState(() {
                                  valueMinutes = newValue as String?;
                                  print(newValue);
                                });
                              },
                              items: items.map((valueMinutes) {
                                return DropdownMenuItem(
                                  value: valueMinutes,
                                  child: Text(
                                    valueMinutes,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              print(isSwitched);

                              setState(() {
                                isSwitched = value;
                                print('số giây  ${this.second}');
                              });
                            },
                            activeTrackColor: Colors.pink,
                            activeColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }

  void _showDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text("Lời nhắc"),
            content: Text("Nhập sai"),
          ),
        );
      },
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    // TODO: implement shouldRepaint

    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
