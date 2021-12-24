import 'dart:convert';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:screen1/screens/clock_screen.dart';
import 'package:screen1/screens/luutru.dart';
import 'package:screen1/screens/testdata.dart';
import 'end_drawer_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/ovningar_list_model.dart';

import 'package:hive_flutter/hive_flutter.dart';

class OvningarScreen extends StatefulWidget {
  const OvningarScreen({Key? key}) : super(key: key);

  @override
  _OvningarScreenState createState() => _OvningarScreenState();
}

class _OvningarScreenState extends State<OvningarScreen> {
  Box? friendsBox;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  var note = Note('', '', DateTime.now());
  late PlayerState playerState;
  bool checkScreen = true;
  bool isClicked = false;
  bool isClicked1 = true;
  bool checkedLesson = true;
  String? valueLesson;
  bool clickedImg = true;
  bool showitem = false;

  dynamic ovingarListModel = OvingarListModel(
      id: 1, name: '', images: '', description: '', group: '', url: '');

  AudioPlayer audioPlayer = new AudioPlayer();

  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;
  @override
  void initState() {
    // TODO: implement initState
    getFriendsBox();

    super.initState();
  }

  void getFriendsBox() async {
    friendsBox = Hive.box("friends");
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \t EEE d MMM').format(now);
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
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: const <Color>[
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
                            height: 85,
                            width: 340,
                            child: Card(
                              borderOnForeground: false,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Color(0xffEAF4F5),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 3, 20, 0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage(ovingarList[index].images),
                                  ),
                                  title: Text(
                                    ovingarList[index].name,
                                    style: TextStyle(
                                        color: Color(0xff378591),
                                        fontFamily: 'Roboto-Medium',
                                        fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    ovingarList[index].description,
                                    style: TextStyle(
                                        color: Color(0xff378591),
                                        fontFamily: 'Roboto-Light',
                                        fontSize: 15),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      showitem = true;
                                    });
                                    // setState(() {
                                    //   ovingarListModel = OvingarListModel(
                                    //       images: ovingarList[index].images,
                                    //       title: ovingarList[index].title,
                                    //       subtileText:
                                    //           ovingarList[index].subtileText);
                                    // });

                                    setState(() {
                                      ovingarListModel = OvingarListModel(
                                          id: ovingarList[index].id,
                                          name: ovingarList[index].name,
                                          images: ovingarList[index].images,
                                          description:
                                              ovingarList[index].description,
                                          url: ovingarList[index].url,
                                          group: ovingarList[index].group);

                                      if (ovingarListModel?.id == 21) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClockScreen()));
                                      }
                                    });
                                    print(ovingarListModel.name);
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
                    // isClicked = !isClicked;
                    if (!isClicked) {
                      isClicked = !isClicked;
                    }
                  });
                },
                child: Visibility(
                  visible: showitem,
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
                                      isClicked = !isClicked;
                                    });
                                  },
                                ),
                              )
                            : null,
                        body: isClicked
                            ? SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 20),
                                        height: 200,
                                        width: 200,
                                        child: Image.asset(
                                            ovingarListModel.images)),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      ovingarListModel?.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Roboto-Light',
                                          fontSize: 26),
                                    ),
                                    Text(
                                      ovingarListModel?.description,
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
                                            margin: EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 250,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "${duration.inMinutes}:${duration.inSeconds.remainder(60)}",
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                slider(),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  iconSize: 45.0,
                                                  onPressed: () {
                                                    print('về 15s');
                                                    setState(() {
                                                      print(position.inSeconds);
                                                      if (position.inSeconds <=
                                                          30) {
                                                        audioPlayer.seek(
                                                            new Duration(
                                                                seconds: 0));
                                                      } else {
                                                        audioPlayer.seek(
                                                            new Duration(
                                                                seconds: position
                                                                        .inSeconds -
                                                                    15));
                                                      }
                                                    });
                                                  },
                                                  color: Colors.white,
                                                  icon: ImageIcon(
                                                    AssetImage(
                                                        'assets/images/back15.png'),
                                                  )),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  getAudio();
                                                },
                                                child: Icon(
                                                  playing == false
                                                      ? Icons.play_arrow
                                                      : Icons.pause,
                                                  size: 60,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              IconButton(
                                                  color: Colors.white,
                                                  iconSize: 45.0,
                                                  onPressed: () {
                                                    print('tiến 15s');
                                                    setState(() {
                                                      print(duration.inSeconds);

                                                      if (position.inSeconds >=
                                                          duration.inSeconds -
                                                              15) {
                                                        audioPlayer.seek(Duration(
                                                            seconds: duration
                                                                .inSeconds));
                                                      } else {
                                                        audioPlayer.seek(Duration(
                                                            seconds: (position
                                                                    .inSeconds +
                                                                15)));
                                                      }
                                                    });
                                                  },
                                                  icon: ImageIcon(
                                                    AssetImage(
                                                        'assets/images/forward15.png'),
                                                  )),
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
                                                    setState(() {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TestData()));
                                                    });
                                                    // friendsBox.get(key)
                                                    // setState(() {
                                                    //
                                                    //   isClicked = !isClicked;
                                                    //
                                                    // });
                                                  },
                                                  icon: Icon(Icons
                                                      .playlist_add_check_rounded))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            getAudio();
                                          },
                                          child: Icon(
                                            playing == false
                                                ? Icons.play_arrow
                                                : Icons.pause_circle,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        slider(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        endDrawer: EndDrawerScreen(),
                      ),
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

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
        min: 0.0,
        activeColor: Colors.orange,
        inactiveColor: Colors.white54,
        value: position.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            print(position.inSeconds.toDouble());
            audioPlayer.seek(
                new Duration(seconds: value.toInt().roundToDouble().round()));
            audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
            audioPlayer.setReleaseMode(ReleaseMode.LOOP);
          });
        },
        onChangeEnd: (double value) {
          checkedLesson
              ? setState(() {
                  if (position.inSeconds.toDouble() ==
                      duration.inSeconds.toDouble()) {
                    _showDialog1(context);
                  }
                  print('ssss');
                })
              : null;
          // setState(() {
          //   if (position.inSeconds.toDouble() ==
          //       duration.inSeconds.toDouble()) {}
          //   _showDialog1(context);
          // });
        },
      ),
    );
  }

  void getAudio() async {
    var url =
        'https://wpdb.mindfulnessapps.com/wp-content/uploads/2019/12/Tre-medvetna-andetag.mp3';
    var url2 = ovingarListModel?.url;
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url2, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }

  void _showDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text("Skriv anteckning"),
            content: Text("Max antal ord: 100"),
            actions: <Widget>[
              Container(
                height: 130,
                child: Column(
                  children: [
                    TextField(
                      controller: _noteController,
                      decoration: InputDecoration(
                        label: Text('Lagg till kommentar'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            child: Text(
                              'AVBRYT',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              print('Không đồng ý');
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FlatButton(
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              print('Đồng ý');
                              final noteTitle = _noteController.text;
                              final title = ovingarListModel?.name;

                              var person =
                                  Note(noteTitle, title, DateTime.now());

                              friendsBox?.add(person);
                              person.save();
                              print(friendsBox?.length);
                              print(person.noteTitle);
                              print(person.title);

                              print(friendsBox?.values.length);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
