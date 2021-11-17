import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SliderScreen2 extends StatefulWidget {

  @override
  _SliderScreen2State createState() => _SliderScreen2State();
}

class _SliderScreen2State extends State<SliderScreen2> {
  String? valueMinutes;
  final items = ['1 min', '2 min', '3 min', '4 min'];
  bool isSwitched=true;

  bool isPlaying = false;
  int seconds = 10;
  int seconds1 = 50;
  int selected = 0;



  @override
  Widget build(BuildContext context) {
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
        margin: EdgeInsets.fromLTRB(30, 0, 0, 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SleekCircularSlider(
                initialValue: 0,
                min: 0,
                max:60,
                appearance: CircularSliderAppearance(
                  infoProperties: InfoProperties(
                    mainLabelStyle: TextStyle(
                      color: Colors.white,fontSize: 50
                    ),
                    modifier: (double value){
                      final budget=(value).toInt();
                      return ' $budget \$';
                    }
                  ),
                  startAngle: 272,
                  counterClockwise: false,
                  spinnerDuration: 34,
                  angleRange: 360,
                  size: MediaQuery.of(context).size.width*0.7,
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    progressBarColor:Colors.orange,
                    trackColor: Colors.white
                  ),
                  customWidths: CustomSliderWidths(
                    progressBarWidth: 10,
                    trackWidth: 10
                  ),
                ),
                onChange: (value){
                  print(value);
                },

              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              width: 130,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orangeAccent)
              ),
              child: FlatButton(
                child: Text('START',style: TextStyle(color: Colors.white),),
                onPressed: (){

                },
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              width: 300,
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
                      elevation: 0,
                      dropdownColor: Colors.white70,
                      value: valueMinutes,
                      onChanged: (newValue) {
                        setState(() {
                          valueMinutes = newValue as String?;
                        });
                      },
                      items: items.map((valueMinutes) {
                        return DropdownMenuItem(
                          value: valueMinutes,
                          child: Text(valueMinutes,style: TextStyle(color: Colors.white),),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 40,),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      print(isSwitched);

                      setState(() {
                        isSwitched = value;
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
// Widget slider1 = SleekCircularSlider(
//   appearance: CircularSliderAppearance(
//     size: 250,
//     startAngle: 270,
//     angleRange: 360,
//     customWidths: CustomSliderWidths(
//       progressBarWidth: 10,
//     ),
//     customColors: CustomSliderColors(
//       hideShadow: true,
//       trackColor: Colors.white,
//       progressBarColor: Colors.orange,
//       shadowMaxOpacity: 20,
//     ),
//
//   ),
//   initialValue: 25,
//   onChange: (double value){
//     print(value);
//   },
// );
