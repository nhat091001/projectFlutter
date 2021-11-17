import 'package:flutter/material.dart';
import 'package:screen1/screens/ovningar.dart';

class MeditationCard extends StatelessWidget {
  const MeditationCard(
      {required this.title, required this.image, required this.router});
  final String title;
  final String image;
  final String router;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ClipRRect(
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Text("\n$title"),
        ],
      ),
    );
  }
}
