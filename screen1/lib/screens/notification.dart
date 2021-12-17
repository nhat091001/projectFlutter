import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

class TestNotification extends StatefulWidget {
  const TestNotification({Key? key}) : super(key: key);

  @override
  _TestNotificationState createState() => _TestNotificationState();
}

class _TestNotificationState extends State<TestNotification> {
  FlutterLocalNotificationsPlugin? localNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize = new AndroidInitializationSettings("light.png");
    var iOSInitalize = new IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false);
    var initialzationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitalize);
    localNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    localNotificationsPlugin?.initialize(initialzationSettings);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        'channelId', 'channelName',
        importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotificationsPlugin?.show(0, 'notification title',
        'notification body', generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test notification'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showNotification();
                  });
                },
                child: Text('Notification'))
          ],
        ),
      ),
    );
  }
}
