import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/cart_page/view/cart_page_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/change_color_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/deep_cleaning_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/kids_shoes_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/leather_cleaning_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/one_day_order_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/simple_cleaning_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/whitening_treatment_view.dart';
import 'package:klinik_shoes_project/module/categories_page/view/woman_shoes_view.dart';
import 'package:klinik_shoes_project/module/history_page/view/history_page_view.dart';
import 'package:klinik_shoes_project/module/login_page/view/login_page_view.dart';
import 'package:klinik_shoes_project/module/profile_page/view/profile_page.dart';
import 'package:klinik_shoes_project/module/signup_page/view/signup_page_view.dart';
import 'package:klinik_shoes_project/module/welcome_page/view/welcome_page_view.dart';
import 'package:klinik_shoes_project/module/homepage/view/homepage_view.dart';
import 'package:klinik_shoes_project/module/homepage/controller/homepage_controller.dart';
import 'package:klinik_shoes_project/module/camerapage/view/camerapage_view.dart'; // Import halaman kamera
import 'package:klinik_shoes_project/module/camerapage/controller/camerapage_controller.dart'; // Import controller kamera jika diperlukan

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String simple_cleaning = '/simple';
  static const String deep_cleaning = '/deep';
  static const String change_color = '/change';
  static const String leather_cleaning = '/leather';
  static const String kids_shoes = '/kids';
  static const String woman_shoes = '/woman';
  static const String whitening_treatment = '/whitening';
  static const String one_day_order = '/one_day';
  static const String history1 = '/history1';
  static const String profile = '/profile';
  static const String camera = '/camera';

  static String getHomeRoute() => welcome;

  static List<GetPage> routes = [
    GetPage(
      page: () => WelcomePage(),
      name: welcome,
    ),
    GetPage(
      page: () => LoginPageView(),
      name: login,
    ),
    GetPage(
      page: () => SignupPageView(),
      name: signup,
    ),
    GetPage(
      page: () =>
          HomePageView(controller: HomePageController()), // Perbaikan di sini
      name: home,
    ),
    GetPage(
      page: () => CameraPageView(),
      name: camera,
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CameraPageController());}),
    ),
    GetPage(page: () => CartPage(), name: cart),
    GetPage(page: () => SimpleCleaningView(), name: simple_cleaning),
    GetPage(page: () => DeepCleaningView(), name: deep_cleaning),
    GetPage(page: () => ChangeColorView(), name: change_color),
    GetPage(page: () => LeatherCleaningView(), name: leather_cleaning),
    GetPage(page: () => KidShoesView(), name: kids_shoes),
    GetPage(page: () => WomanShoesView(), name: woman_shoes),
    GetPage(page: () => WhiteningTreatmentView(), name: whitening_treatment),
    GetPage(page: () => OneDayOrderView(), name: one_day_order),
    GetPage(page: () => HistoryPage(), name: history1),
    GetPage(page: () => ProfilePage(), name: profile)
  ];
}
