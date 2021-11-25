import 'package:flutter/material.dart';
import 'package:screen1/screens/clock2.dart';
import 'package:screen1/screens/clock_screen.dart';
import 'package:screen1/screens/media_music_screen.dart';
import 'package:screen1/screens/seconds_brain.dart';
import 'package:screen1/screens/slider1.dart';
import 'end_drawer_screen.dart';
import 'meditation_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'omhjarnfokus_screen.dart';
import 'smakprov_boken_screen.dart';
import 'paminelser_screen.dart';
import 'bottom_button_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'min_profil_screen.dart';
import '../drawer_screen.dart';
import '../models/ovningar_list_model.dart';

class OvningarScreen extends StatefulWidget {


  ////////////////
  @override
  _OvningarScreenState createState() => _OvningarScreenState();
}

class _OvningarScreenState extends State<OvningarScreen> {
  bool checkScreen=true;
  bool isClicked=false;
  var duration = 20.0;
  bool checkedLesson = true;
  bool clickedImg = true;

  updateSlider({newDuration}) {
    setState(() {
      duration = newDuration;
    });
  }

  void changeImage() {
    setState(() {
      clickedImg = !clickedImg;
    });
  }

  bool playing= false;
  IconData playBtn=Icons.play_arrow;
  late AudioPlayer _player;
  late AudioCache cache;

  Duration position=new Duration();
  Duration musicLength=new Duration();


  // chúng ta sẽ tạo một thanh trượt tùy chỉnh
  Widget slider(){
    return Container(
      width: 250.0,
      child: Slider.adaptive(
          activeColor: Colors.white,
          inactiveColor: Colors.red,
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value){
            seekToSec(value.toInt());
          }),
    );
  }

// hãy tạo hàm tìm kiếm cho phép chúng ta đi đến một vị trí nhất định của bản nhạc
  void seekToSec(int sec){
    Duration newPos=Duration(seconds: sec);
    _player.seek(newPos);
  }


  //Bây giờ hãy khởi tạo trình phát của chúng ta
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player=AudioPlayer();
    cache=AudioCache(fixedPlayer: _player);

    // bây giờ hãy xử lý thời gian audioplayer
    // hàm này sẽ cho phép bạn lấy thời lượng nhạc

    // _player.durationHandler = (d) {
    //
    // };

    _player.onDurationChanged.listen((d) {
      setState(() {
        musicLength = d;
      });
    });

    // hàm này sẽ cho phép chúng ta di chuyển con trỏ của thanh trượt trong khi chúng ta đang phát bài hát
    // _player.positionHandler = (p) {
    //
    // };

    _player.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    late OvingarListModel ovingarListModel=new OvingarListModel(images: '', title: '', subtileText: '');
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/media':(context)=>MediaMusicScreen(ovingarListModel),
      },
      home: Stack(
        children: [
          Container(
            child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        'För en fokuserad vardag',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Roboto-Light'),
                      ),
                    ),
                  ),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color(0xff2B9EB1),
                          Color(0xff41B1C3),
                          Color(0xff86DEEB),
                        ],
                      ),
                    ),
                  ),
                  title: Container(
                    margin: EdgeInsets.fromLTRB(110, 20, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Övningar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'Roboto-Medium'),
                        ),
                      ],
                    ),
                  ),
                ),
                body: SafeArea(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        height: 90,
                        width: 340,
                        child: Card(
                          borderOnForeground: false,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color(0xffEAF4F5),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  ovingarList[index].images,
                                ),
                              ),
                              title: Text(
                                ovingarList[index].title,
                                style: TextStyle(
                                    color: Color(0xff378591),
                                    fontFamily: 'Roboto-Medium',
                                    fontSize: 18),
                              ),
                              subtitle: Text(
                                ovingarList[index].subtileText,
                                style: TextStyle(
                                    color: Color(0xff378591),
                                    fontFamily: 'Roboto-Light',
                                    fontSize: 15),
                              ),
                              onTap: () {
                                 ovingarListModel = OvingarListModel(
                                    images: ovingarList[index].images,
                                    title: ovingarList[index].title,
                                    subtileText: ovingarList[index].subtileText);
                               print('this is ${ovingarList[index].title}');
                                setState(() {
                                  if (index == 0) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));
                                  }
                                  if (index == 1) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));

                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));
                                  }
                                  if (index == 2) {

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));
                                  }
                                  if (index == 3) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));

                                  }
                                  if (index == 4) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));

                                  }
                                  if (index == 5) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));

                                  }
                                  if (index == 6) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));

                                  }
                                  if (index == 7) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));

                                  }
                                  if (index == 8) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));

                                  }
                                  if (index == 9) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MediaMusicScreen(
                                    //           image: ovingarListModel.images,
                                    //           title: ovingarListModel.title,
                                    //           subline: ovingarListModel.subtileText,
                                    //         )));
                                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MediaMusicScreen(ovingarListModel)));

                                  }
                                  // if (index == 10) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 11) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 12) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 13) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 14) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 15) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 16) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 17) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MediaMusicScreen(
                                  //             image: ovingarListModel.images,
                                  //             title: ovingarListModel.title,
                                  //             subline: ovingarListModel.subtileText,
                                  //           )));
                                  // }
                                  // if (index == 18) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => SleepPage()));
                                  // }
                                  if (index == 19) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ClockScreen()));
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: ovingarList.length,
                    shrinkWrap: true,
                    //padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                  ),
                ),
                endDrawer: EndDrawerScreen()),
          ),
          ///end
         // MediaMusicScreen(title: ovingarListModel.title,image: ovingarListModel.images,subline: ovingarListModel.subtileText,),
          Container(child:checkScreen?null: MediaMusicScreen(ovingarListModel)),

        ],

      ),
    );
  }
}
