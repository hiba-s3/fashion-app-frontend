import 'package:fashion1/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home.dart';
import '../view/tryVirtual.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  final RxList<Map<String, String>> trends = [
    {'image': 'assets/4.jpg', 'title': 'Shirt', 'category': 'T-shirt'},
    {'image': 'assets/2.jpg', 'title': 'Blouse', 'category': 'Top'},
    {'image': 'assets/3.jpg', 'title': 'Sweater', 'category': 'Winter Wear'},
    {'image': 'assets/3.jpg', 'title': 'Jeans', 'category': 'Pants'},
    {'image': 'assets/1.jpg', 'title': 'Jacket', 'category': 'Outerwear'},
    {'image': 'assets/3.jpg', 'title': 'Shoes', 'category': 'Footwear'},
  ].obs;

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.to(() => HomePage());
        break;
      case 1:
        Get.to(() => TryVirtual());
        break;
      case 2:
        Get.to(() => ProfilePage());
        break;
    }
  }
}
