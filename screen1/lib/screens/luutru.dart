import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'luutru.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  late String noteTitle;
  late String title;
  late DateTime dateTime;
  Note(this.noteTitle, this.title, this.dateTime);
}
