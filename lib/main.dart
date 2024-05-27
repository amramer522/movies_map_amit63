import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_amit63/service_locator.dart';
import 'package:movies_amit63/views/products/view.dart';

import 'core/helper_methods.dart';
import 'views/my_map.dart';
// hello amoor
// hello amoor2
void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: const MyMapView(),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigatorKey,
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
