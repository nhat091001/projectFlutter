import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TestNotufication2 extends StatefulWidget {
  const TestNotufication2({Key? key}) : super(key: key);

  @override
  _TestNotufication2State createState() => _TestNotufication2State();
}

class _TestNotufication2State extends State<TestNotufication2> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings? androidInitializationSettings;
  IOSInitializationSettings? iosInitializationSettings;
  InitializationSettings? initializationSettings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializing();
  }

  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings('light');
    iosInitializationSettings = IOSInitializationSettings();
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings!);
  }

  void _showNotifications() async {
    await notification();
  }

  void _showNotificationsAfter() async {
    await notificationAfter();
  }

  Future<void> notification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
    );
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'Hello there', 'this is content notification', notificationDetails);
  }
  //

  Future<void> notificationAfter() async {
    var timeDelayed = DateTime.now().add(Duration(seconds: 5));
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
    );
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(0, 'Hello there',
        'this is c time notification2', timeDelayed, notificationDetails);
  }

  Future onSelectNotification(String payLoad) async {
    if (payLoad != null) {
      print(payLoad);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payLoad) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print('');
            },
            child: Text('ok')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Notification2'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showNotifications();
                },
                child: Text('Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showNotificationsAfter();
                },
                child: Text('After'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
