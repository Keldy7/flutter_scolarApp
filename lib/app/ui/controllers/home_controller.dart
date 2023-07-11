import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/controllers/storage.dart';

import '../styles/colors.dart';

class HomeController extends GetxController {
  ThemeData get theme => isDark ? getDarkThemeData() : getLightThemeData();

  bool get introAvailable => isIntroAvailable;

  bool get isLogin => isLoggedIn;

  bool fromDetail = false;

}
