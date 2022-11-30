import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPlugin {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;

  var initializationSettings;

  NotificationPlugin._() {
    init();
  }
  init() async {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestIOSPermission();
    }
    initializePlatformSpecifics();
  }

  initializePlatformSpecifics() {
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    void initNotifications() async {
      var initializeAndroid = initializationSettingsAndroid;
      var initializeIOS = initializationSettingsDarwin;
      var initializationSettings = InitializationSettings(
          android: initializeAndroid, iOS: initializeIOS);

      await localNotificationsPlugin.initialize(initializationSettings);
    }
  }

  _requestIOSPermission() {
    localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: false, badge: true, sound: true);
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await localNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (payload) async {
      //   onNotificationClick(payload);
      // },
    );
  }

  Future<void> showNotification(
      {required int id, required String title, required String body}) async {
    var androidChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        icon: "mipmap/launcher_icon",
        ticker: 'ticker');

    var iosChannelSpecifics = DarwinNotificationDetails(
      categoryIdentifier: 'plainCategory',
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidChannelSpecifics,
      iOS: iosChannelSpecifics,
    );
    await localNotificationsPlugin.show(
        id, title, body, platformChannelSpecifics,
        payload: id.toString());
  }

  Future<void> showScheduledNotification(
      {required int id,
      required String title,
      required String body,
      required DateTime date}) async {
    var scheduledNotificationDateTime = date;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id', 'your other channel name');
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      categoryIdentifier: 'plainCategory',
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await localNotificationsPlugin.schedule(id, '$title', '  $body',
        scheduledNotificationDateTime, platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }

  Future<void> removeNotifications() async {
    await localNotificationsPlugin.cancelAll();
  }

}

NotificationPlugin notificationPlugin = NotificationPlugin._();
