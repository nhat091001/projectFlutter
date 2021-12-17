import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:screen1/screens/luutru2.dart';
import 'package:screen1/screens/notification.dart';
import 'package:screen1/screens/notification2.dart';
import 'package:screen1/screens/testData2.dart';
import 'package:screen1/screens/test_validate.dart';
import '../drawer_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PaminelserScreen extends StatefulWidget {
  @override
  _PaminelserScreenState createState() => _PaminelserScreenState();
}

class _PaminelserScreenState extends State<PaminelserScreen> {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings? androidInitializationSettings;
  IOSInitializationSettings? iosInitializationSettings;
  InitializationSettings? initializationSettings;

  final _formKey = GlobalKey<FormState>();
  bool isSwitched = true;
  bool isSwitched1 = false;
  String? valueChoose;
  String? valueChoose1;
  int? selected;
  Box? friendsBox;
  Box? myBox;

  // dynamic pamin2 = Pamin(2, '', '', true);
  //

  late String default_choice = '';
  int default_index = 0;
  List<MyChoice> choices = [
    MyChoice(index: 1, choice: "30m"),
    MyChoice(index: 2, choice: "1h"),
    MyChoice(index: 3, choice: "2h"),
  ];

  final items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
  ];

  final items1 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
  ];

  setSelectedRadio(int val) {
    setState(() {
      selected = val;
    });
  }

  void getFriendsBox() async {
    myBox = Hive.box("myBox");
  }

  @override
  void initState() {
    // TODO: implement initState
    getFriendsBox();
    selected = 0;
    super.initState();
    intitializing();
  }

  void intitializing() async {
    androidInitializationSettings = AndroidInitializationSettings('light');
    iosInitializationSettings = IOSInitializationSettings();
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin?.initialize(initializationSettings!);
  }

  void _showNotificationDuration() async {
    await notificationDuration();
  }

  Future<void> notificationDuration() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            priority: Priority.high,
            importance: Importance.max,
            ticker: 'test');
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    // for (int i = 0; i<2; i++) {
    //   if (i == 1) {
    //     setState(() {
    //       timeDuration = DateTime.now().add(Duration(seconds: 30));
    //     });
    //   }
    //   await flutterLocalNotificationsPlugin?.schedule(i, this.default_choice,
    //       'Nội dung ${timeDuration}}', timeDuration, notificationDetails);
    // }

    var timeDuration = DateTime.now().add(Duration(seconds: 30));

    if (default_choice == '30m') {
      setState(() {
        var time1 = int.parse(valueChoose!);
        var time2 = int.parse(valueChoose!);
        var result = time1 + 1 / 2;
        var timeDuration = DateTime.now().add(Duration(seconds: 30));
        String formattedDate = DateFormat('kk ').format(timeDuration);
        print(formattedDate);
        print(result);
      });
      await flutterLocalNotificationsPlugin?.schedule(
          1,
          this.default_choice,
          'Nội dung ${valueChoose} ${valueChoose1}',
          timeDuration,
          notificationDetails);
    } else if (default_choice == '1h') {
      setState(() {
        var time1 = int.parse(valueChoose!);
        var time2 = int.parse(valueChoose!);
        var result = time1 + 1;
        timeDuration = DateTime.now().add(Duration(seconds: 60));
        String formattedDate = DateFormat('kk ').format(timeDuration);
        print(formattedDate);
        print(result);
      });
      await flutterLocalNotificationsPlugin?.schedule(
          1,
          this.default_choice,
          'Nội dung ${valueChoose} ${valueChoose1}}',
          timeDuration,
          notificationDetails);
    } else if (default_choice == '2h') {
      setState(() {
        var time1 = int.parse(valueChoose!);
        var time2 = int.parse(valueChoose!);
        var result = time1 + 2;
        timeDuration = DateTime.now().add(Duration(seconds: 120));
        String formattedDate = DateFormat('kk ').format(timeDuration);
        print(formattedDate);
        print(result);
      });
      await flutterLocalNotificationsPlugin?.schedule(
          1,
          this.default_choice,
          'Nội dung ${valueChoose} ${valueChoose1}}',
          timeDuration,
          notificationDetails);
    }
  }

  Future onSelectNotification(String payLoad) async {
    if (payLoad != null) {
      print(payLoad);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payLoad) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print('');
            },
            child: Text('ok')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic pamin1 = Pamin(
        default_index, valueChoose.toString(), valueChoose1.toString(), true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff3EAFC1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PÅMINNELSER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Roboto-Medium'),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.white,
                  activeColor: Color(0xff3EAFC1),
                )
              ],
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(),
        ),
        title: Container(
          margin: EdgeInsets.fromLTRB(110, 10, 0, 0),
        ),
      ),
      body: Container(
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text(
                              'Frekvens',
                              style: TextStyle(
                                  color:
                                      isSwitched ? Colors.black : Colors.grey,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              child: Row(
                                children: choices
                                    .map((data) => Row(
                                          children: [
                                            Radio(
                                                activeColor: Color(0xff3EAFC1),
                                                value: data.index,
                                                groupValue: default_index,
                                                onChanged: isSwitched
                                                    ? (value) {
                                                        setState(() {
                                                          default_choice =
                                                              data.choice;
                                                          default_index =
                                                              data.index;
                                                        });
                                                      }
                                                    : null),
                                            Text(
                                              '${data.choice}',
                                              style: TextStyle(
                                                  color: isSwitched
                                                      ? Colors.black
                                                      : Colors.grey,
                                                  fontFamily: 'Roboto-Light'),
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Start',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: isSwitched
                                            ? Colors.black
                                            : Colors.grey,
                                        fontSize: 16,
                                        fontFamily: 'Roboto-Light'),
                                  ),
                                  DropdownButton(
                                    hint: Text('Select item: ',
                                        style: TextStyle(
                                            color: isSwitched
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 14,
                                            fontFamily: 'Roboto-Light')),
                                    dropdownColor: Colors.white,
                                    underline: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                    value: valueChoose,
                                    onChanged: isSwitched
                                        ? (newValue) {
                                            setState(() {
                                              if (newValue != null)
                                                valueChoose =
                                                    newValue as String?;
                                            });
                                          }
                                        : null,
                                    items: items.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Stopp',
                                      style: TextStyle(
                                          color: isSwitched
                                              ? Colors.black
                                              : Colors.grey,
                                          fontSize: 16,
                                          fontFamily: 'Roboto-Light')),
                                  DropdownButton(
                                    elevation: 0,
                                    underline: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                    hint: Text('Select item: ',
                                        style: TextStyle(
                                            color: isSwitched
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 14,
                                            fontFamily: 'Roboto-Light')),
                                    dropdownColor: Colors.white,
                                    value: valueChoose1,
                                    onChanged: isSwitched
                                        ? (newValue1) {
                                            setState(() {
                                              valueChoose1 =
                                                  newValue1 as String?;
                                            });
                                          }
                                        : null,
                                    items: items1.map((valueItem1) {
                                      return DropdownMenuItem(
                                        value: valueItem1,
                                        child: Text(valueItem1),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Vibrera',
                              style: TextStyle(
                                fontSize: 15,
                                color: isSwitched ? Colors.black : Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                            ),
                            Switch(
                              value: isSwitched1,
                              onChanged: isSwitched
                                  ? (value) {
                                      isSwitched1 = value;
                                      setState(() {
                                        print(isSwitched1);
                                      });
                                    }
                                  : null,
                              activeTrackColor: Colors.blue.shade100,
                              activeColor: Color(0xff3EAFC1),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: valueChoose != null &&
                              valueChoose1 != null &&
                              default_index >= 1
                          ? Color(0xff3EAFC1)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  width: 300,
                  height: 50,
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    color: Color(0xff3EAFC1),
                    onPressed: valueChoose != null &&
                            valueChoose1 != null &&
                            default_index >= 1
                        ? () {
                            // print(valueChoose);
                            // print(valueChoose1);
                            // print(default_index);

                            final noteIndex = default_index;
                            final noteChoose = valueChoose;
                            final noteChoose1 = valueChoose1;
                            final noteSwitch1 = isSwitched1;

                            var pamin = Pamin(noteIndex, noteChoose!,
                                noteChoose1!, noteSwitch1);
                            myBox?.add(pamin);
                            //myBox?.add(pamin2);
                            //myBox?.add(pamin1);
                            pamin.save();
                            print(noteIndex);
                            print(noteChoose);
                            print(noteChoose1);
                            print(noteSwitch1);
                            print("số lượng ${myBox?.length}");

                            _showNotificationDuration();
                          }
                        : null,
                    child: Text('SPARA',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: Text('check'),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestData2()));
                          });
                        },
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text('')
                      // ElevatedButton(
                      //   child: Text('notification 1'),
                      //   onPressed: () {
                      //     setState(() {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => TestNotification()));
                      //     });
                      //   },
                      // ),
                      // ElevatedButton(
                      //   child: Text('notification 2'),
                      //   onPressed: () {
                      //     setState(() {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => TestNotufication2()));
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}
