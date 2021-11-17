import 'package:flutter/material.dart';

class LoggScreenModel {
  LoggScreenModel(
      {required this.title, required this.date, required this.time});
  final String title;
  final String date;
  final String time;
}

List<LoggScreenModel> loggList = <LoggScreenModel>[
  LoggScreenModel(
      title: 'Tre Medvetna Andetag', date: '2021-07-03 .', time: ' 16:21:30'),
  LoggScreenModel(
      title: 'Fokusminuten', date: '2021-07-03 . ', time: ' 16:21:30 .'),
  LoggScreenModel(
      title: 'Fokusminuten', date: '2021-07-03 . ', time: ' 16:21:30 .'),
];
