import 'package:dio/dio.dart';

class Diohelp {
  static Dio mydio;

  static void init() async {
    mydio = await Dio(
      BaseOptions(
        baseUrl: "https://fcm.googleapis.com/fcm/send",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postMessegeNotficarion(messege, name, thesuertoken) {
    mydio.options.headers = {
      "Content-Type": "application/json",
      "Authorization":
          "key=AAAA5DDNt5o:APA91bGoce7qGirKs8vyVoMC3FWOVl_5brfprzVSNNSnnU4buqar4JuSOZ8XNJrv-a0iHoAYM83HgTGd9efGsPqps1A0773Vu26z6U3RerRqUHgpRi3LUoyk_WdBJkL4YWbNUejqSVo7"
    };
    return mydio.post("", data: {
      "to": "$thesuertoken",
      "notification": {"body": "$messege", "title": "$name"},
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "sound": "default",
        "status": "done",
        "screen": "screenA",
      },
    });
  }

  static Future<Response> postMessegeNotficariontoAllUsers(
    messege,
  ) {
    mydio.options.headers = {
      "Content-Type": "application/json",
      "Authorization":
          "key=AAAA5DDNt5o:APA91bGoce7qGirKs8vyVoMC3FWOVl_5brfprzVSNNSnnU4buqar4JuSOZ8XNJrv-a0iHoAYM83HgTGd9efGsPqps1A0773Vu26z6U3RerRqUHgpRi3LUoyk_WdBJkL4YWbNUejqSVo7"
    };
    return mydio.post("", data: {
      "to": "/topics/users",
      "notification": {"body": "$messege", "title": "الحاج عقبي"},
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "sound": "default",
        "status": "done",
        "screen": "screenA",
      },
    });
  }
}
