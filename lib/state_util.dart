import 'package:flutter/material.dart';

class Get {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get currentContext {
    final context = navigatorKey.currentState?.context;
    if (context == null) {
      throw Exception(
          'No Navigator context found! Ensure that the navigatorKey is properly set.');
    }
    return context;
  }

  static Future<void> to(Widget page) async {
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );
    // No return statement needed
  }

  static void back() {
    if (navigatorKey.currentState?.canPop() == true) {
      navigatorKey.currentState?.pop();
    }
  }

  static void offAll(Widget page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.height; // Fixed to return height
  }

  static ValueNotifier<ThemeData> mainTheme =
      ValueNotifier<ThemeData>(ThemeData());

  static void changeTheme(ThemeData theme) {
    mainTheme.value = theme;
  }

  static ThemeData get theme {
    return Theme.of(currentContext);
  }
}
