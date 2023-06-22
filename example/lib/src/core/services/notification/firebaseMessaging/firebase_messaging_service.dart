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
    // kullanıcının tokenini kaydetmemiz gerekiyor
    // TODO: save token
    showNotificationForeground();
  }

  Future<void> requestNotificationPermission() async =>
      await messaging.requestPermission();

  void showNotificationForeground() {
    onMessage.listen(
      (event) {
        if (Platform.isAndroid == true) {
          // push notification - açık
          // cloud messaging - açık
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 1,
              channelKey: NotificationConsts.channelKey,
              title: event.notification?.title ?? '',
              body: event.notification?.body ?? '',
              payload: {'data': json.encode(event.data)},
            ),
          );
        } else if (Platform.isIOS == true) {
          // push notification - açık - otomatik
          // cloud messaging - açık - otomatik
        }
      },
    );
  }

  void clickNotificationBackground() {
    onMessageOpenedApp.listen(
      (event) {
        if (Platform.isAndroid == true) {
          // push notification - arka plan
          // cloud messaging - arka plan - otomatik

          // payload example event.data['type']
          // TODO: do something
        } else if (Platform.isIOS == true) {
          // push notification - açık - actionReceiveMethod.listenda tetikleniyor
          // push notification - arka plan - actionReceiveMethod.listenda tetikleniyor
          // cloud messaging - açık - actionReceiveMethod.listenda tetikleniyor
          // cloud messaging - arka plan - actionReceiveMethod.listenda tetikleniyor

          // payload example event.data['type']
          // TODO: do something
        }
      },
    );
  }

  Future<void> controlTerminatedNotification() async {
    var isNotification = await messaging.getInitialMessage();
    if (Platform.isAndroid == true) {
      // push notification - kapalı - otomatikse
      // cloud messaging - kapalı - otomatikse
      if (isNotification != null) {
        // TODO: do something
      }
    } else if (Platform.isIOS == true) {
      // push notification - kapalı - onActionReceiveMethod tetikleniyor
      // cloud messaging - kapalı - onActionReceiveMethod tetikleniyor
      if (isNotification != null) {
        // TODO: do something
      }
    }
  }
}

// notification yerine data payloadı gelirse göstermek için burayı aktifleştiriyoruz
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Platform.isAndroid == true) {
    // push notification - arka plan - otomatik
    // push notification - kapalı - otomatik
    // cloud messaging - arka plan - otomatik
    // cloud messaging - kapalı - otomatik
  } else if (Platform.isIOS == true) {}
}
