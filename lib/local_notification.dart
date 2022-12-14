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

  initializePlatformSpecifics() async {
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icons');
    var initializeAndroid = initializationSettingsAndroid;
    var initializeIOS = initializationSettingsDarwin;
    var initializationSettings = InitializationSettings(
        android: initializeAndroid, iOS: initializeIOS);

    await localNotificationsPlugin.initialize(initializationSettings);

  }
  void initNotifications() async {

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
        'your channels', 'your channels',
        channelDescription: 'your channels',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('soundss'),
        icon: "app_icons");

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

    var androidPlatformChannelSpecifics =AndroidNotificationDetails(
        'your order channels', 'your order channels',
        channelDescription: 'your order channels',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('soundss'),
        icon: "app_icons");
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
