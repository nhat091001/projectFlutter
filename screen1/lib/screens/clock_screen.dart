import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:math' as math;
import 'ovningar.dart';
import 'seconds_brain.dart';

class ClockScreen extends StatefulWidget {


  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  String? valueMinutes;
  final items = ['1 min', '2 min', '3 min', '4 min'];
  bool isPlaying = false;
  bool isSwitched = false;
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
   int second=600;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
  void changeSecond(){
    setState(() {
      if(isSwitched && valueMinutes=='1 min'){
        print(second);
        print(valueMinutes);
        setState(() {
          second=60;
          controller.duration = Duration(seconds: second);
        });

        // controller.duration = const Duration(seconds: 30);
      }
      else if(isSwitched && valueMinutes=='2 min'){
        setState(() {
          second=120;
          controller.duration = Duration(seconds: second);
        });
      }
      else if(isSwitched && valueMinutes=='3 min'){
        setState(() {
          second=180;
          controller.duration = Duration(seconds: second);
        });
      }
      else if(isSwitched && valueMinutes=='4 min'){
        setState(() {
          second=240;
          controller.duration = Duration(seconds: second);
        });
      }
      else if(!isSwitched){
        setState(() {
          second=600;
          controller.duration = Duration(seconds: second);
        });
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
      body: Container(
        margin: EdgeInsets.fromLTRB(60, 50, 60, 0),
        child: Column(
          children: <Widget>[
            AspectRatio(
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


            Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              width: 120,
              child: FlatButton(
                color: Colors.orange,
                height: 50,
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
                                fontSize: 20),
                          )
                        : Text(
                            'START',
                            style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                color: Colors.white,
                                fontSize: 20),
                          ));
                  },
                ),
                onPressed: () {
                  setState(() => isPlaying = !isPlaying);
                  if (controller.isAnimating) {
                    controller.stop(canceled: false);
                  } else {
                    controller.reverse(
                        from: controller.value == 0.0 ? 1.0 : controller.value);
                  }
                },
              ),
            ),


            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white70,
                border: Border.all(color: Colors.white54),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Klockor varje: ',style: TextStyle(color: Colors.white70),),
                  SizedBox(width: 10,),
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
                          child: Text(valueMinutes,style: TextStyle(color: Colors.black),),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      print(isSwitched);

                      setState(() {
                        isSwitched = value;
                        changeSecond();
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
      endDrawer: EndDrawerScreen(),
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

