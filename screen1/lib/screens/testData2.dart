import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:screen1/screens/test_validate.dart';

import 'luutru2.dart';

class TestData2 extends StatefulWidget {
  @override
  _TestData2State createState() => _TestData2State();
}

class _TestData2State extends State<TestData2> {
  String? valueChoose;
  String? valueChoose1;
  dynamic pamin2 = Pamin(2, '', '', true);
  bool isSwitched = true;
  Box? myBox;
  late String default_choice = '';
  int default_index = 0;
  List<MyChoice> choices = [
    MyChoice(index: 1, choice: "30m"),
    MyChoice(index: 2, choice: "1h"),
    MyChoice(index: 3, choice: "2h"),
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
    Pamin pamin = Pamin(2, '', '', true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lưu dữ liệu'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  myBox?.clear();
                });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        child: Container(
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
                            child: Text(myBox!.getAt(index).index.toString()),
                          ),
                          Container(
                            child: Text(myBox!.getAt(index).item1.toString()),
                          ),
                          Container(
                            child: Text(myBox!.getAt(index).item2.toString()),
                          ),
                          // Container(
                          //   child: Text(pamin.item1),
                          // ),
                          // Container(
                          //   child: Text(pamin.item2),
                          // ),
                          // Container(
                          //   child: Text(pamin.index.toString()),
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

                          // Container(
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text('Stopp',
                          //           style: TextStyle(
                          //               color: isSwitched
                          //                   ? Colors.black
                          //                   : Colors.grey,
                          //               fontSize: 16,
                          //               fontFamily: 'Roboto-Light')),
                          //       DropdownButton(
                          //         elevation: 0,
                          //         underline: Container(
                          //           height: 40,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(6),
                          //               border:
                          //                   Border.all(color: Colors.black38)),
                          //         ),
                          //         hint: Text('Select item: ',
                          //             style: TextStyle(
                          //                 color: isSwitched
                          //                     ? Colors.black
                          //                     : Colors.grey,
                          //                 fontSize: 14,
                          //                 fontFamily: 'Roboto-Light')),
                          //         dropdownColor: Colors.white,
                          //         value: valueChoose1,
                          //         onChanged: isSwitched
                          //             ? (newValue1) {
                          //                 setState(() {
                          //                   valueChoose1 = newValue1 as String?;
                          //                 });
                          //               }
                          //             : null,
                          //         items: items1.map((valueItem1) {
                          //           return DropdownMenuItem(
                          //             value: valueItem1,
                          //             child: Text(valueItem1),
                          //           );
                          //         }).toList(),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
