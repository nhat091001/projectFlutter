import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:screen1/screens/luutru2.dart';
import 'package:screen1/screens/testData2.dart';
import 'package:screen1/screens/test_validate.dart';
import '../drawer_screen.dart';

class PaminelserScreen extends StatefulWidget {
  @override
  _PaminelserScreenState createState() => _PaminelserScreenState();
}

class _PaminelserScreenState extends State<PaminelserScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = true;
  bool isSwitched1 = false;
  String? valueChoose;
  String? valueChoose1;
  int? selected;
  Box? friendsBox;
  Box? myBox;

  var pamin1 = Pamin(1, '', '', true);

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
  }

  @override
  Widget build(BuildContext context) {
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
                            print(noteIndex);
                            print(noteChoose);
                            print(noteChoose1);
                            print(noteSwitch1);
                            print("số lượng ${myBox?.length}");
                          }
                        : null,
                    child: Text('SPARA2',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                Container(
                  child: ElevatedButton(
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
