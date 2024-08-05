import 'package:fashion1/view/profile.dart';
import 'package:fashion1/view/saved_items.dart';
import 'package:fashion1/view/settings/about_us.dart';
import 'package:fashion1/view/settings/account.dart';
import 'package:fashion1/view/settings/setting.dart';
import 'package:fashion1/view/trendItem.dart';
import 'package:fashion1/view/tryVirtual.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'downloadPhoto.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion App',
      theme:
          ThemeData(primarySwatch: Colors.blue, fontFamily: 'SignikaNegative'),

      // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system,

      home: HomePage(),
    );
  }
}
