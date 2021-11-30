import 'package:flutter/material.dart';
import 'package:screen1/models/ovningar_list_model.dart';

class TestMedia extends StatefulWidget {
  final OvingarListModel ovingarListModel;
  TestMedia(this.ovingarListModel);
  @override
  _TestMediaState createState() => _TestMediaState();
}

class _TestMediaState extends State<TestMedia> {
  bool changeScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: GestureDetector(
        onTap: () {
          print('collapsed');
          setState(() {
            changeScreen = !changeScreen;
            print(changeScreen);
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.ovingarListModel.title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
