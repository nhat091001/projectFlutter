import 'package:flutter/material.dart';
import 'package:screen1/models/ovningar_list_model.dart';
import 'package:screen1/screens/media_music_screen.dart';
import '../models/ovningar_list_model.dart';

class BottomButtonScreen extends StatefulWidget {
  final OvingarListModel ovingarListModel;
  BottomButtonScreen({required this.ovingarListModel});
  @override
  _BottomButtonScreenState createState() => _BottomButtonScreenState();
}

class _BottomButtonScreenState extends State<BottomButtonScreen> {
  double current = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: 290,
          width: 360,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue)),
          child: GestureDetector(
            onTap: () {
              //    OvingarListModel ovingarListModel=OvingarListModel(images: ovingarList., title: title, subtileText: subtileText)
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>MediaMusicScreen(title: ovingarList., image: image, subline: subline)))
            },
            child: Container(
              child: Row(
                children: [
                  Container(
                      child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {},
                  )),
                  Container(
                      child: Slider(
                    value: current,
                    min: 1,
                    label: current.round().toString(),
                    max: 100.0,
                    onChanged: (double value) {
                      setState(() {
                        current = value;
                      });
                    },
                  )),
                  Container(
                    child: Text(widget.ovingarListModel.description),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
