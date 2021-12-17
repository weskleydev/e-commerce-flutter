import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init('e-commerce');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 425,
        maxHeight: 755,
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.indigo.shade900,
          Colors.blueGrey.withOpacity(0.9),
          Colors.black54,
        ], begin: Alignment.topLeft, end: Alignment.bottomLeft)
            // decoration: BoxDecoration(
            //   boxShadow: [BoxShadow(color: Colors.black12)],
            // color: Colors.black87
            ),
        child: GetMaterialApp(
          title: "E-commerce",
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
              primaryColor: Colors.indigo.shade900,
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.white, fontSize: 18),
              ),
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent, elevation: 10)),
        ),
      ),
    ),
  ));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
