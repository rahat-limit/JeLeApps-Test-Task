import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingApi {
  final messaging = FirebaseMessaging.instance;

  Future<String> initMessaging() async {
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      print('Token: $token');
      return token ?? '';
    }
    return '';
  }
}
