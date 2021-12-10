import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:screen1/models/ovningar_list_model.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'luutru.dart';

class TestData extends StatefulWidget {
  @override
  _TestDataState createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  bool _expanded = false;
  bool _customTileExpanded = false;
  var _test = "Full Screen";
  String? valueLesson;

  final items = ['All', '2 days ago', '1 month ago', '2 months ago'];

  Box? friendsBox;

  @override
  void initState() {
    getFriendsBox();
    super.initState();
  }

  void getFriendsBox() async {
    friendsBox = Hive.box("friends");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff50B6C7),
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              'Logg',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Roboto-Medium'),
            ),
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
                  child: DropdownButton(
                    hint: Text('Filter'),
                    dropdownColor: Colors.white,
                    value: valueLesson,
                    onChanged: (newValue) {
                      setState(() {
                        valueLesson = newValue as String?;
                      });
                    },
                    items: items.map((valueLesson) {
                      return DropdownMenuItem(
                        value: valueLesson,
                        child: Text(valueLesson),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(145, 30, 0, 0),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      friendsBox?.clear();
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 130, 20, 0),
              child: ValueListenableBuilder(
                valueListenable: Hive.box('friends').listenable(),
                builder: (context, box, widget) {
                  return ListView.builder(
                      itemCount: friendsBox?.length,
                      itemBuilder: (BuildContext contex, index) {
                        return SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(
                                color: Color(0xff50B6C7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                ExpansionTile(
                                  title: Container(
                                    child: Text(
                                      friendsBox?.getAt(index)!.title,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                          friendsBox!
                                              .getAt(index)
                                              .dateTime
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Roboto-Light',
                                              fontSize: 12,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  trailing: Icon(null),
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Divider(
                                            color: Colors.white,
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 250, 0),
                                            child: Text(
                                              friendsBox
                                                  ?.getAt(index)!
                                                  .noteTitle,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Light',
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}
