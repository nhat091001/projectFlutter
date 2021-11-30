# screen1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

///
isClicked? Align(
alignment: Alignment.bottomCenter,
child: Container(
color: Colors.black,
height: 100,
child:Row(
children: [
Container(
child: IconButton(
iconSize: 62.0,
color: Colors.blue[800],
onPressed: () {
//here we will add the functionality of the play button
if (!playing) {
//now let's play the song
cache.play("assets/audio/assets_note2.wav");
setState(() {
playBtn = Icons.pause;
playing = true;
});
} else {
_player.pause();
setState(() {
playBtn = Icons.play_arrow;
playing = false;
});
}
},
icon: Icon(
playBtn,
),
),
),
Container(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(
child:isClicked?null: Text(
"${position.inMinutes}:${position.inSeconds.remainder(60)}",
style: TextStyle(
fontSize: 18.0,
),
),
),
slider(),
Container(
child:isClicked?null: Text(
"${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
style: TextStyle(
fontSize: 18.0,
),
),
),
],
),
),
],
),
),
):