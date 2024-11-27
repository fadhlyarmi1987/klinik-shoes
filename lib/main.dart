import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_shoes_project/core.dart';
// import 'package:klinik_shoes_project/module/speaker/view/speaker_notif_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final fcmService = FCMService();
  fcmService.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Klinik Shoes Project',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: SpeakerPageView()
      initialRoute: AppRoutes.getHomeRoute(),
      getPages: AppRoutes.routes
    );
  }
}
