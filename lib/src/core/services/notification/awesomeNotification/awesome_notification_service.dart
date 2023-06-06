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
    if (receivedAction.summary == 'local') {
      // do something
    }
  } else if (Platform.isAndroid == true) {
    // payload example json.decode(receivedAction.payload!['data']!))['type']
    // do something
  }
}

