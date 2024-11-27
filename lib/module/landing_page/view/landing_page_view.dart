import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/core.dart';
import '../controller/landing_page_controller.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  Widget build(context, LandingPageController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Landing Page"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<LandingPageView> createState() => LandingPageController();
}
