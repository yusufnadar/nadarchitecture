import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../constants/notification/notification_constants.dart';
import 'awesome_schedule_notification.dart';

class AwesomeNotificationService {
  AwesomeNotificationService._init();

  static final AwesomeNotificationService _instance =
      AwesomeNotificationService._init();

  static AwesomeNotificationService get instance => _instance;

  final awesomeNotification = AwesomeNotifications();

  final awesomeScheduleNotification = AwesomeScheduleNotification.instance;

  Future<void> init() async {
    await initializeNotificationChannel();

    var permission = await checkPermissionList();
    if (permission.isEmpty) {
      await requestPermissionToSendNotifications();
    }
    awesomeNotification.setListeners(
      onActionReceivedMethod: onActionReceiveMethod,
    );
  }

  Future<bool> requestPermissionToSendNotifications() {
    // Uygulamadan bildirim atmak için izin istediğimiz kısım
    return awesomeNotification.requestPermissionToSendNotifications(
      channelKey: NotificationConsts.channelKey,
      permissions: [
        NotificationPermission.Sound,
        NotificationPermission.Alert,
        NotificationPermission.Light,
        NotificationPermission.Badge,
        NotificationPermission.Vibration,
      ],
    );
  }

  Future<List<NotificationPermission>> checkPermissionList() {
    return awesomeNotification.checkPermissionList(
      channelKey: NotificationConsts.channelKey,
      permissions: [
        NotificationPermission.Alert,
        NotificationPermission.Sound,
        NotificationPermission.Light,
        NotificationPermission.Badge,
        NotificationPermission.Vibration,
      ],
    );
  }

  Future<void> initializeNotificationChannel() async {
    await awesomeNotification.initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: NotificationConsts.channelKey,
          channelKey: NotificationConsts.channelKey,
          channelName: NotificationConsts.channelName,
          channelShowBadge: true,
          criticalAlerts: true,
          importance: NotificationImportance.High,
          channelDescription: NotificationConsts.channelDescription,
        )
      ],
      debug: false,
    );
  }
}

Future<void> onActionReceiveMethod(ReceivedAction receivedAction) async {
  if (Platform.isIOS == true) {
    // push notification - kapalı - getInitialMessageda tetikleniyor
    // cloud messaging - kapalı - getInitialMessageda tetikleniyor
    // push notification - açık - onMessageOpenedApple.listenda tetikleniyor
    // push notification - arka plan - onMessageOpenedApple.listenda tetikleniyor
    // cloud messaging - açık - onMessageOpenedApple.listenda tetikleniyor
    // cloud messaging - arka plan - onMessageOpenedApple.listenda tetikleniyor

    // firebase bildirimiyle local notification bildirimi
    // çakışmasın diye kontrol ediyoruz
    if (receivedAction.summary == 'local') {
      // TODO: do something
    }
  } else if (Platform.isAndroid == true) {
    // push notification - açık
    // cloud messaging - açık
    // push notification - kapalı - otomatik değilse
    // cloud messaging - arka plan - otomatik değilse
    // cloud messaging - kapalı - otomatik değilse


    // example payload json.decode(receivedAction.payload!['data']!))['type']
    if (receivedAction.summary == 'local') {
      // TODO: do something
    }
  }
}
