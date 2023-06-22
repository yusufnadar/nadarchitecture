import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../constants/local/local_constants.dart';
import '../../local/local_service.dart';

class AwesomeScheduleNotification {
  AwesomeScheduleNotification._init();

  static final AwesomeScheduleNotification _instance =
      AwesomeScheduleNotification._init();

  static AwesomeScheduleNotification get instance => _instance;

  final awesomeNotification = AwesomeNotifications();

  final localService = LocalService.instance;

  dynamic hour;
  dynamic minute;
  late DateTime lastDate;

  var wordList = <Map<String, dynamic>>[
    {
      'title': 'Hey sen',
      'body': 'Hata alabilirsin ama başaracaksın',
      'month': 6,
      'day': 6
    },
    {
      'title': 'Hey sen2',
      'body': 'Hata alabilirsin ama başaracaksın2',
      'month': 5,
      'day': 7
    },
  ];

  Future<void> setNotification({thisDay, dayNumber, month}) async {
    int thisYear = DateTime.now().year;
    for (int day = thisDay ?? 1; day <= dayNumber; day++) {
      var word = wordList.where(
          (element) => element['month'] == month && element['day'] == day);
      if (word.isNotEmpty == true) {
        await awesomeNotification.createNotification(
          content: NotificationContent(
            id: int.parse(
                '${thisYear.toString().substring(1)}$month$day$hour$minute'),
            channelKey: 'high_importance_channel',
            title: word.first['title'],
            summary: 'local',
            body: word.first['body'],
            actionType: ActionType.Default,
          ),
          schedule: NotificationCalendar(
            hour: hour,
            month: month,
            minute: minute,
            day: day,
            timeZone: await awesomeNotification.getLocalTimeZoneIdentifier(),
            repeats: false,
          ),
        );
      }
      lastDate = DateTime(thisYear, month, day, hour, minute);
    }
  }

  Future<void> cancel() async {
    await awesomeNotification.cancelAll();
  }

  Future<void> checkDateAndActivateNotification({hour, minute}) async {
    // bildirimlerin süresinin bitmesine 3 günden az kaldıysa yenileniyor
    if (localService.read(LocalConstants.notificationTime) != null) {
      if (DateTime.parse(localService.read(LocalConstants.notificationTime))
              .difference(DateTime.now())
              .inDays <
          3) {
        await startScheduleNotification(hour: hour, minute: minute);
      }
    } else {
      await startScheduleNotification(hour: hour, minute: minute);
    }
  }

  Future<void> startScheduleNotification({hour, minute}) async {
    this.hour = hour;
    this.minute = minute;
    await cancel();
    var now = DateTime.now();
    var thisDay = now.day;
    // eğer bildirim saati bugünün saatini geçtiyse bildirimler yarından
    // itibaren atılmaya başlanıyor
    bool isAfter = DateTime(now.year, now.month, now.day, hour, minute,
            now.second, now.millisecond, now.microsecond)
        .isAfter(
      now,
    );
     if (isAfter == false) {
      thisDay += 1;
    }
    // bildirimleri 2 aylık oluşturuyoruz çünkü max 64 bildirimi belleğinde tutuyor
    switch (now.month) {
      case 1:
        {
          await setNotification(thisDay: thisDay, dayNumber: 31, month: 1);
          await setNotification(dayNumber: 28, month: 2);
        }
        break;
      case 2:
        {
          await setNotification(thisDay: thisDay, dayNumber: 28, month: 2);
          await setNotification(dayNumber: 31, month: 3);
        }
        break;
      case 3:
        {
          await setNotification(thisDay: thisDay, dayNumber: 31, month: 3);
          await setNotification(dayNumber: 30, month: 4);
        }
        break;
      case 4:
        {
          await setNotification(thisDay: thisDay, dayNumber: 30, month: 4);
          await setNotification(dayNumber: 31, month: 5);
        }
        break;
      case 5:
        {
          await setNotification(thisDay: thisDay, dayNumber: 31, month: 5);
          await setNotification(dayNumber: 30, month: 6);
        }
        break;
      case 6:
        {
          await setNotification(thisDay: thisDay, dayNumber: 30, month: 6);
          await setNotification(dayNumber: 31, month: 7);
        }
        break;
      case 7:
        {
          await setNotification(thisDay: thisDay, dayNumber: 31, month: 7);
          await setNotification(dayNumber: 31, month: 8);
        }
        break;
      case 8:
        {
          await setNotification(thisDay: thisDay, dayNumber: 31, month: 8);
          await setNotification(dayNumber: 30, month: 9);
        }
        break;
      case 9:
        {
          await setNotification(thisDay: thisDay, dayNumber: 30, month: 9);
          await setNotification(dayNumber: 31, month: 10);
        }
        break;
      case 10:
        {
          await setNotification(thisDay: thisDay, dayNumber: 31, month: 10);
          await setNotification(dayNumber: 30, month: 11);
        }
        break;
      case 11:
        {
          await setNotification(thisDay: thisDay, dayNumber: 30, month: 11);
          await setNotification(dayNumber: 31, month: 12);
        }
        break;
      case 12:
        {
          await setNotification(thisDay: thisDay, dayNumber: 31, month: 12);
          await setNotification(dayNumber: 31, month: 1);
        }
        break;
    }
    // bildirim oluşturulduğunda bunu oluşturuldu olarak işaretliyoruz
    await localService.write(LocalConstants.notificationStatus, true);
    // bildirimin zamanını kaydediyoruz
    await localService.write(
      LocalConstants.notificationTime,
      lastDate.toIso8601String(),
    );
  }
}
