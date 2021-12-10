import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screen1/screens/bottom_button_screen.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:screen1/screens/paminelser_screen.dart';
import '../models/ovningar_list_model.dart';
import 'package:screen1/screens/ovningar.dart';
import 'ovningar.dart';

class MediaMusicScreen extends StatefulWidget {
  // MediaMusicScreen(
  //     {required this.title, required this.image, required this.subline});
  // final String title;
  // final String image;
  // final String subline;

  final OvingarListModel ovingarListModel;
  MediaMusicScreen(this.ovingarListModel);
  @override
  _MediaMusicScreenState createState() => _MediaMusicScreenState();
}

class _MediaMusicScreenState extends State<MediaMusicScreen> {
  bool isClicked = false;
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

  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  // chúng ta sẽ tạo một thanh trượt tùy chỉnh
  Widget slider() {
    return Container(
      width: 240.0,
      child: Slider.adaptive(
          activeColor: Colors.white,
          inactiveColor: Colors.red,
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
    _player = AudioPlayer();
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

  ////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      // padding: isClicked
      //     ? EdgeInsets.fromLTRB(0, 300, 0, 0)
      //     : EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: isClicked
          ? MediaQuery.of(context).size.height * 0.18
          : MediaQuery.of(context).size.height,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Scaffold(
          backgroundColor: Color(0xff7EDAE8),
          appBar: isClicked
              ? null
              : AppBar(
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
                ),
          body: Container(
            height: isClicked
                ? MediaQuery.of(context).size.height * 0.14
                : MediaQuery.of(context).size.height,
            color: Colors.red,
            child: Column(
              children: [
                Visibility(
                  visible: isClicked ? false : true,
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(widget.ovingarListModel.images),
                      )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            widget.ovingarListModel.description,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto-Light',
                                fontSize: 26),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.ovingarListModel.description,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto-Light',
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            width: 500.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                slider(),
                                Text(
                                  "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 45.0,
                          color: Colors.blue,
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous,
                          ),
                        ),
                        IconButton(
                          iconSize: 62.0,
                          color: Colors.blue[800],
                          onPressed: () {
                            //here we will add the functionality of the play button
                            if (!playing) {
                              //now let's play the song
                              cache.play("assets/audio/assets_note2.wav");
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
                          color: Colors.blue,
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
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
                            },
                            icon: Icon(Icons.playlist_add_check_rounded))
                      ],
                    )
                  ]),
                ),
                Visibility(
                  visible: isClicked ? true : false,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: isClicked
                        ? Row(
                            children: [
                              Container(
                                child: IconButton(
                                  iconSize: 40.0,
                                  color: Colors.blue[800],
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: isClicked
                                          ? null
                                          : Text(
                                              "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                            ),
                                    ),
                                    slider(),
                                    Container(
                                      child: isClicked
                                          ? null
                                          : Text(
                                              "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
          endDrawer: EndDrawerScreen(),
        ),
      ),
    );
  }
}
