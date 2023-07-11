import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/home_controller.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        (controller.isLogin)
            ? Constant.goToNextPage(context, Routes.homeScreenRoute)
            : (controller.introAvailable)
                ? Constant.goToNextPage(context, Routes.homeScreenRoute)
                // Constant.goToNextPage(context, Routes.introRoute)
                // : Constant.goToNextPage(context, Routes.loginRoute);
                : Constant.goToNextPage(context, Routes.homeScreenRoute);
      },
    );
  }

  backClick(BuildContext context) {
    Constant.backToFinish(context);
  }

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: getAccentColor(context),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getSvgImageWithSize(context, "splash_logo.svg", 102.h, 148.h,
                    fit: BoxFit.fill),
                26.h.verticalSpace,
                getCustomFont(nomAppKey, 28, Colors.white, 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontsFamilySplash,
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
        onWillPop: () async {
          backClick(context);
          return false;
        });
  }
}
