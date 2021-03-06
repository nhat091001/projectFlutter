import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/logg_model.dart';
import 'end_drawer_screen.dart';

class LoggScreen extends StatefulWidget {
  @override
  _LoggScreenState createState() => _LoggScreenState();
}

class _LoggScreenState extends State<LoggScreen> {
  bool _expanded = false;
  bool _customTileExpanded = false;
  var _test = "Full Screen";
  String? valueLesson;

  final items = ['All', '2 days ago', '1 month ago', '2 months ago'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                        _showDialog(context);
                      },
                    ),
                  ),
                ],
              ),


              Container(
                margin: EdgeInsets.all(10),
                height: 500,
                width: 320,
                child: ListView.builder(
                    itemCount: loggList.length,
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
                                    loggList[index].title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),

                                subtitle: Row(
                                  children: [
                                    Text(loggList[index].date,
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Light',
                                            fontSize: 12,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(loggList[index].time,
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Light',
                                            fontSize: 12,
                                            color: Colors.white))
                                  ],
                                ),
                                trailing: Icon(null),

                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Divider(color: Colors.white,),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 250, 0),
                                          child: Text(
                                            'keep1',
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
                    }),
              ),
            ],
          ),
        ),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Alert!!"),
        content: new Text("You are awesome!"),
        actions: <Widget>[
          new ElevatedButton(
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Text('?????ng ??'),
                SizedBox(
                  width: 20,
                ),
                Text("H???y"),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
