import 'package:flutter/material.dart';
import 'package:screen1/models/ovningar_list_model.dart';
import 'package:screen1/screens/media_music_screen.dart';
class BottomButtonScreen extends StatefulWidget {
  BottomButtonScreen({required this.title, required this.images, required this.subline});
  final String title;
  final String images;
  final String subline;

  @override
  _BottomButtonScreenState createState() => _BottomButtonScreenState();
}

class _BottomButtonScreenState extends State<BottomButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.fromLTRB(0, 540, 0, 0),
        height: 90,
        width: 360,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue)
        ),
        child: GestureDetector(
          onTap: (){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>MediaMusicScreen(title:widget.title, image: widget.images, subline: widget.subline)));
          },
          child: Container(
            child: Row(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: (){

                    },
                  )
                ),
                Container(
                  child: Text(widget.title),
                ),
              ],
            ),

          ),
        ));
  }
}
