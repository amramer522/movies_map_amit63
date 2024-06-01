import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_amit63/service_locator.dart';
import 'package:movies_amit63/views/products/view.dart';

import 'core/cache_helper.dart';
import 'core/helper_methods.dart';
import 'views/cart/view.dart';
import 'views/lines.dart';
import 'views/my_map.dart';

// hello amoor
// hello amoor2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale("en"),
      Locale("ar"),
      Locale("fr"),
    ],
    path: "assets/translations",
    fallbackLocale: Locale("en"),
    startLocale: Locale("ar"),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: const CartView(),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder())),
        home: child,
      ),
    );
  }
}

/*
transaltions (make cmd instruction and tell them how to send dynamic value to the translations)
register
otp
add item to cart
delete item
coupon
firebase
notifications

 */
