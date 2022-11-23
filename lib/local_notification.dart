import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin localNotificationsPlugin = FlutterLocalNotificationsPlugin();

final DarwinInitializationSettings initializationSettingsDarwin =
DarwinInitializationSettings(
  requestAlertPermission: false,
  requestBadgePermission: false,
  requestSoundPermission: false,

);
const AndroidInitializationSettings initializationSettingsAndroid =
AndroidInitializationSettings('app_icon');
void initNotifications () async {
  var initializeAndroid = initializationSettingsAndroid;
  var initializeIOS = initializationSettingsDarwin;
  var initializationSettings = InitializationSettings(android: initializeAndroid,iOS: initializeIOS);

  await localNotificationsPlugin.initialize(initializationSettings);
}

// Future singleNotification(DateTime scheduledDate, String title, String body, int hashCode, {String sound}) async {
//   var androidChannel = AndroidNotificationDetails(
//     'channel-id', 'channel-name',
//     importance: Importance.max,
//     priority: Priority.max,
//   );
//
//   var iosChannel = DarwinNotificationDetails();
//   var platformChannel = NotificationDetails(android: androidChannel, iOS: iosChannel);
//
//   localNotificationsPlugin.schedule(hashCode, title, body, scheduledDate, platformChannel, payload: hashCode.toString());
// }