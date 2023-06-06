import 'awesomeNotification/awesome_notification_service.dart';
import 'firebaseMessaging/firebase_messaging_service.dart';

class NotificationService {
  NotificationService._init();

  static final NotificationService _instance = NotificationService._init();

  static NotificationService get instance => _instance;

  final firebaseMessagingService = FirebaseMessagingService.instance;
  final awesomeNotificationService = AwesomeNotificationService.instance;

  Future<void> init() async {
    await firebaseMessagingService.init();
    await awesomeNotificationService.init();
  }

  Future<void> sendNotification() async {
    /*
    var msg = {
      "to":
      'dvxBRdRLTqa_84S4VjFfu3:APA91bFLzF1vTQBAd2fHghroOA1xUq-Ew3yvGmvS2xt34IWEDhjLARud7WAY9EwtKTneN1RxyGRo2lNFFg7ZcKsKZqB342l7UsnGx9tkjnqEo7FnYc1X5c5VV8BO8XhW4eoifKZa4tpW',
      // eğer notificationı göndermezsek bildirim otomatik olarak oluşmuyo
      "notification": {"title": "aa", "body": "body"},
      // "data": {"title": "Testt2", "body": "Heyy2"}
    };
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'key=AAAApgEnkgM:APA91bFJTPvNkAXbbvcwqlF4hpzbmLL9O8aaINO-59Tpf0yBE8IHEioLAJsT0HJAkMta1xeQ7KM-pmUY5BEuFiJJ0e8xf-RUQRjQfisFedwHeBLMX1_Ab5SBiE99TCMbZPtQLApbPKte'
      },
      body: jsonEncode(msg),
    );
    */
  }
}

