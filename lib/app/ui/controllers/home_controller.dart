import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../styles/colors.dart';
import 'storage.dart';

class HomeController extends GetxController {
  ThemeData get theme => isDark ? getDarkThemeData() : getLightThemeData();

  bool get introAvailable => isIntroAvailable;

  bool get isLogin => isLoggedIn;

  bool fromDetail = false;

}
