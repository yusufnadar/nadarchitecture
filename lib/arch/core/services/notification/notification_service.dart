const notificationService = """
import 'dart:convert';
import '../../constants/notification/notification_constants.dart';
import '../../exports/constants_exports.dart';
import '../network/network_service.dart';
import 'awesomeNotification/awesome_notification_service.dart';
import 'firebaseMessaging/firebase_messaging_service.dart';

class NotificationService {
  NotificationService._init();

  static final NotificationService _instance = NotificationService._init();

  static NotificationService get instance => _instance;

  final firebaseMessagingService = FirebaseMessagingService.instance;
  final awesomeNotificationService = AwesomeNotificationService.instance;
  final networkService = NetworkService.instance;

  Future<void> init() async {
    await firebaseMessagingService.init();
    await awesomeNotificationService.init();
  }

  Future<void> sendNotification(
      String otherUserToken, String title, String body) async {
    // farklı bir kullanıcıdan diğerine cloud messaging sayesinde bildirim gönderdiğimiz kısım
    networkService?.send(
      '',
      type: HttpTypes.post,
      parseModel: null,
      token: NotificationConsts.cloudMessaging,
      // eğer notification parametresini göndermezsek bildirim otomatik olarak oluşmuyo
      data: json.encode(
        {
          'to': otherUserToken,
          "notification": {'title': title, 'body': body},
          // "data": {"title": "Testt2", "body": "Heyy2"}
        },
      ),
    );
  }
}
""";