import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart' as getX;

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void init() async {
    // Minta izin untuk notifikasi
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Pengguna memberikan izin");
    } else {
      print("Pengguna menolak izin");
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      final prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.getBool('isLoggedIn');

      if (message.data['route'] != null) {
        getX.Get.offAllNamed(message.data['route']);
      } else {
        if (isLoggedIn ?? false) {
          getX.Get.offAllNamed('/home');
        } else {
          getX.Get.offAllNamed('/login');
        }
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Pesan diterima di latar depan: ${message.notification?.title}");
    });
  }
}
