import 'package:attendance/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: CustomeColors.iconColor),
        scaffoldBackgroundColor: CustomeColors.scaffoldBg,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: CustomeColors.iconColor),
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          backgroundColor: CustomeColors.scaffoldBg,
        ),
      ),
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
