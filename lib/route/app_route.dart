import 'package:adventure/controllers/welcome/welcome_control.dart';
import 'package:adventure/views/adventure_game.dart';
import 'package:adventure/views/welcome.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: '/welcome',
      page: () => const WelcomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(WelcomeScreenController());
      }),
    ),
    GetPage(
      name: '/game',
      page: () => Adventure_game(),
    ),
  ];
}