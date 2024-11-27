import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/login_page/view/login_page_view.dart';
import 'package:klinik_shoes_project/module/signup_page/view/signup_page_view.dart';
import 'package:klinik_shoes_project/service/notification/NotificationService.dart'; // Pastikan import path yang benar

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 390,
              height: 844,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFFEAFBF9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 118,
                    top: -82,
                    child: Container(
                      width: 375,
                      height: 375,
                      decoration: ShapeDecoration(
                        color: Color(0xFF29D6C8),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -190,
                    top: 394,
                    child: Container(
                      width: 448,
                      height: 450,
                      decoration: ShapeDecoration(
                        color: Color(0xFF29D6C8),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -297,
                    top: -21,
                    child: Container(
                      width: 555,
                      height: 512,
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 10, color: Color(0xFFA9EEE9)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 367,
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 10, color: Color(0xFFD4F6F4)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 75,
                    top: 524,
                    child: Text(
                      'Good People are using Good Shoes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w300,
                        height: 0.08,
                        letterSpacing: -0.23,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -13,
                    top: 178,
                    child: Container(
                      width: 415.76,
                      height: 408,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('asset/logo_klinik_shoes.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 639,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => LoginPageView());
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 109, vertical: 5),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 5, color: Color(0xFFBEF2EE)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x7F000000),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w600,
                                height: 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 709,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => SignupPageView());
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 103, vertical: 8),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 5, color: Color(0xFFA9EEE9)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x7F000000),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w600,
                                height: 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
