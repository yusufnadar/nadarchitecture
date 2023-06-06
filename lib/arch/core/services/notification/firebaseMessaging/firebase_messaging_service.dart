const firebaseMessagingService = """
import 'dart:convert';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../constants/notification/notification_constants.dart';

class FirebaseMessagingService {
  final messaging = FirebaseMessaging.instance;
  final onMessageOpenedApp = FirebaseMessaging.onMessageOpenedApp;
  final onMessage = FirebaseMessaging.onMessage;

  FirebaseMessagingService._init();

  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._init();

  static FirebaseMessagingService get instance => _instance;

  dynamic token;

  Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await requestNotificationPermission();
    await controlTerminatedNotification();
    clickNotificationBackground();
    token = await messaging.getToken();
    // save user token
    showNotificationForeground();
  }

  Future<void> requestNotificationPermission() async =>
      await messaging.requestPermission();

  void showNotificationForeground() {
    onMessage.listen(
      (event) {
        if (Platform.isAndroid == true) {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 1,
              channelKey: NotificationConsts.channelKey,
              title: event.notification?.title ?? '',
              body: event.notification?.body ?? '',
              payload: {'data': json.encode(event.data)},
            ),
          );
        }
      },
    );
  }

  void clickNotificationBackground() {
    onMessageOpenedApp.listen(
      (event) {
        if (Platform.isAndroid == true) {
          // example getting payload event.data['type']
          // do something
        } else if (Platform.isIOS == true) {
          // example getting payload event.data['type']
          // do something
        }
      },
    );
  }

  Future<void> controlTerminatedNotification() async {
    var isNotification = await messaging.getInitialMessage();
    if (Platform.isIOS == true) {
      if (isNotification != null) {
        // do something
      }
    } else if (Platform.isAndroid == true) {
      if (isNotification != null) {
        // do something
      }
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Platform.isAndroid == true) {
  } else if (Platform.isIOS == true) {}
}

""";
