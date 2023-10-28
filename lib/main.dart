import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:gpt/routes/app_pages.dart';
import 'package:gpt/routes/app_routes.dart';

import 'core/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // MobileAds.instance.initialize();
  // MobileAds.instance.updateRequestConfiguration(
  //     RequestConfiguration(testDeviceIds: ['A682D8CE000476450CA50B2C9F02DF05'])
  // );

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // print("initialization status : "+status.adapterStatuses.toString());

  runApp(
      EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('fa', 'IR')],
          path: 'assets/translations',
          fallbackLocale: const Locale('fa', 'IR'),
          child: MyApp()
      )
  );
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final PushNotificationService _notificationService = PushNotificationService();


  @override
  Widget build(BuildContext context) {
    // _notificationService.initialize();

    return GetMaterialApp(
      enableLog: true,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.splash
      ,
      getPages: AppPage.pages,
      // title: 'hospital',
    );
  }
}