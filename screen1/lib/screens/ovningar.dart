import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:screen1/screens/clock2.dart';
import 'package:screen1/screens/clock_screen.dart';
import 'package:screen1/screens/media_music_screen.dart';
import 'package:screen1/screens/seconds_brain.dart';
import 'package:screen1/screens/slider1.dart';
import 'package:screen1/screens/testMedia.dart';
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
  bool checkScreen = true;
  bool isClicked = false;
  bool isClicked1 = true;
  var duration = 20.0;
  bool checkedLesson = true;
  bool clickedImg = true;
  dynamic ovingarListModel =
      OvingarListModel(images: '', title: '', subtileText: '');

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

  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  // chúng ta sẽ tạo một thanh trượt tùy chỉnh
  Widget slider() {
    return Container(
      width: 290.0,
      child: Slider.adaptive(
          inactiveColor: Colors.white54,
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

// hãy tạo hàm tìm kiếm cho phép chúng ta đi đến một vị trí nhất định của bản nhạc
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Bây giờ hãy khởi tạo trình phát của chúng ta
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    cache = AudioCache(fixedPlayer: _player);

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                print('a');
              },
              //child: Container(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey,
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
                                    setState(() {
                                      ovingarListModel = OvingarListModel(
                                          images: ovingarList[index].images,
                                          title: ovingarList[index].title,
                                          subtileText:
                                              ovingarList[index].subtileText);
                                    });
                                    print(ovingarListModel.title);
                                    isClicked = !isClicked;
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

                ///end
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: Container(
                  height: isClicked
                      ? MediaQuery.of(context).size.height
                      : MediaQuery.of(context).size.height * 0.14,
                  child: Container(
                    width: double.infinity,
                    child: Scaffold(
                      backgroundColor: Color(0xff7EDAE8),
                      appBar: isClicked
                          ? AppBar(
                              iconTheme: IconThemeData(color: Colors.white),
                              elevation: 0,
                              backgroundColor: Color(0xff7EDAE8),
                              title: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'HJÄRNFOKUS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Roboto-Medium'),
                                ),
                              ),
                              leading: GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 25,
                                ),
                                onTap: () {
                                  setState(() {
                                    //Navigator.pop(context);
                                    // isClicked=!isClicked;
                                    isClicked = !isClicked;

                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Navigator()));
                                  });
                                },
                              ),
                            )
                          : null,
                      body: isClicked
                          ? Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 200,
                                    width: 200,
                                    child:
                                        Image.asset(ovingarListModel.images)),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  ovingarListModel?.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto-Light',
                                      fontSize: 26),
                                ),
                                Text(
                                  ovingarListModel?.subtileText,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto-Light',
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 90,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Container(
                                        width: 500.0,
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 260,
                                                ),
                                                Text(
                                                  "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Container(child: slider()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              iconSize: 45.0,
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/images/back15.png')),
                                          IconButton(
                                            iconSize: 50,
                                            color: Colors.white,
                                            onPressed: () {
                                              //here we will add the functionality of the play button
                                              if (!playing) {
                                                //now let's play the song
                                                cache.play(
                                                    "assets/audio/song1.mp3");
                                                setState(() {
                                                  playBtn = Icons.pause;
                                                  playing = true;
                                                });
                                              } else {
                                                _player.pause();
                                                setState(() {
                                                  playBtn = Icons.play_arrow;
                                                  playing = false;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              playBtn,
                                            ),
                                          ),
                                          IconButton(
                                              iconSize: 45.0,
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/images/forward15.png')),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 80,
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                              // activeColor: Color(0xff7EDAE8),
                                              activeColor: Colors.white,
                                              checkColor: Color(0xff7EDAE8),
                                              value: this.checkedLesson,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  checkedLesson = value!;
                                                });
                                              }),
                                          SizedBox(
                                            height: 0,
                                          ),
                                          Text(
                                            'Lägg till i loggen',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Roboto-Light',
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            width: 160,
                                          ),
                                          IconButton(
                                              iconSize: 30,
                                              color: Colors.white,
                                              onPressed: () {
                                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomButtonScreen()));
                                                setState(() {
                                                  //Navigator.pop(context);
                                                  // isClicked=!isClicked;
                                                  isClicked = !isClicked;

                                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Navigator()));
                                                });
                                              },
                                              icon: Icon(Icons
                                                  .playlist_add_check_rounded))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              child: Row(
                              children: [
                                Container(
                                  child: IconButton(
                                    iconSize: 40.0,
                                    color: Colors.white,
                                    onPressed: () {
//here we will add the functionality of the play button
                                      if (!playing) {
//now let's play the song
                                        cache.play(
                                            "assets/audio/assets_note2.wav");
                                        setState(() {
                                          playBtn = Icons.pause;
                                          playing = true;
                                        });
                                      } else {
                                        _player.pause();
                                        setState(() {
                                          playBtn = Icons.play_arrow;
                                          playing = false;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      playBtn,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      slider(),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      endDrawer: EndDrawerScreen(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
