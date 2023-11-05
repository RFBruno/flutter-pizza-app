import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/color.dart';
import 'package:pizza_app/routers/app_route_name.dart';
import 'package:pizza_app/routers/app_route_page.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutePage.routes,
      initialRoute: AppRouteName.root,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: white,
          titleTextStyle: TextStyle(
            color: black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
