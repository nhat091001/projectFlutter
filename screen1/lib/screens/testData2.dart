import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:screen1/screens/test_validate.dart';

class TestData2 extends StatefulWidget {
  @override
  _TestData2State createState() => _TestData2State();
}

class _TestData2State extends State<TestData2> {
  bool isSwitched = true;
  Box? myBox;
  late String default_choice = '';
  int default_index = 0;
  List<MyChoice> choices = [
    MyChoice(index: 1, choice: "30m"),
    MyChoice(index: 2, choice: "1h"),
    MyChoice(index: 3, choice: "2h"),
  ];

  @override
  void initState() {
    getFriendsBox();
    super.initState();
  }

  void getFriendsBox() async {
    myBox = Hive.box("myBox");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lưu dữ liệu'),
      ),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: Hive.box('myBox').listenable(),
          builder: (context, box, widget) {
            return ListView.builder(
                itemCount: myBox?.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xff50B6C7),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          child: Text('myBox'),
                        ),
                        Container(
                          child: Text('friendsBox?.getAt(index)!.noteChoose'),
                        ),
                        // Container(
                        //   child: Text('friendsBox?.getAt(index)!.noteChoose1'),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        //   child: Container(
                        //     child: Row(
                        //       children: choices
                        //           .map((data) => Row(
                        //                 children: [
                        //                   Radio(
                        //                       activeColor: Colors.orange,
                        //                       value: data.index,
                        //                       groupValue: default_index,
                        //                       onChanged: isSwitched
                        //                           ? (value) {
                        //                               setState(() {
                        //                                 default_choice =
                        //                                     data.choice;
                        //                                 default_index =
                        //                                     data.index;
                        //                               });
                        //                             }
                        //                           : null),
                        //                   Text(
                        //                     '${data.choice}',
                        //                     style: TextStyle(
                        //                         color: isSwitched
                        //                             ? Colors.black
                        //                             : Colors.grey,
                        //                         fontFamily: 'Roboto-Light'),
                        //                   ),
                        //                 ],
                        //               ))
                        //           .toList(),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
