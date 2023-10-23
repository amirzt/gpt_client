
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gpt/module/splash/splash_binding.dart';
import 'package:gpt/module/splash/splash_page.dart';

import '../module/root/root_binding.dart';
import '../module/root/root_page.dart';
import 'app_routes.dart';

class AppPage{
  static final pages = [
    GetPage(
        name: Routes.root,
        page: () => const RootPage(),
        binding: RootBinding()
    ),
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()
    ),
  ];
}