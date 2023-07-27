import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:scolar_pay/app/utils/size_config.dart';

class Constant {
  static String assetImagePngPath = "assets/images/png/";
  static String assetImageSvgPath = "assets/images/svg/";
  static String assetImagePngPathNight = "assets/imagesNight/";
  static const String fontsFamily = "Montserrat";
  static const String fontsFamilySplash = "Avenir-Next-LT-Pro";
  static const String fontsFamilyOffer = "Plantagenet Cherokee";
  static const String fontsFamilyLato = "Lato-semibold";
  static const String fromLogin = "getFromLoginClick";
  static const String homePos = "getTabPos";
  static const String nameSend = "name";
  static const String imageSend = "image";
  static const String bgColor = "bgColor";
  static const String heroKey = "sendHeroKey";
  static const String sendVal = "sendVal";

  static double defaultProfilePictureHeightAndWidthPercentage = 0.175;

  static const int stepStatusNone = 0;
  static const int stepStatusActive = 1;
  static const int stepStatusDone = 2;
  static const int stepStatusWrong = 3;
  static const double defScreenWidth = 414;
  static const double defScreenHeight = 896;

  static double getPercentSize(double total, double percent) {
    return (percent * total) / 100;
  }

  static void setupSize(BuildContext context,
      {double width = defScreenWidth, double height = defScreenHeight}) {
    ScreenUtil.init(context,
        designSize: Size(width, height), minTextAdapt: true);
  }

  static double getButtonHeightFigma() {
    return 56.h;
  }

  static backToPrev(BuildContext context) {
    Get.back();
  }

  static Future<ui.Image> getImage(String name) {
    final Image image =
        Image(image: AssetImage('${Constant.assetImagePngPath}$name.png'));

    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo image, bool _) {
      completer.complete(image.image);
    }));
    return completer.future;
  }

  static String getFormattedDateShort(int time) {
    DateFormat newFormat = DateFormat("MMM dd, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  static String getFormattedDate(String date, bool simple) {
    try {
      DateTime tempDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
      String format = simple ? "dd MMM yyyy" : "dd MMMM yyyy, hh:mm";
      DateFormat newFormat = DateFormat(format);
      return newFormat.format(tempDate);
    } catch (e) {
      return date;
    }
  }

  static String getImagePngPath(String imageName) {
    return "${Constant.assetImagePngPath}$imageName.png";
  }

  static String getImageSvgPath(String imageName) {
    return "${Constant.assetImageSvgPath}$imageName.svg";
  }

  static getCurrency(BuildContext context) {
    return "FCFA";
  }

  static goToNextPage(BuildContext context, String route, {Object? arguments}) {
    if (arguments != null) {
      Get.toNamed(route, arguments: arguments);
    } else {
      Get.toNamed(route);
    }
  }

  static sendToNextWithBackResult(
      BuildContext context, String route, ValueChanged<dynamic> fun,
      {Object? arguments}) {
    if (arguments != null) {
      Get.toNamed(route, arguments: arguments)!.then((value) {
        fun(value);
      });
    } else {
      Get.toNamed(route)!.then((value) {
        fun(value);
      });
    }
  }

  static String getImageWithExtension(String imageName) {
    if (imageName.toLowerCase().contains('svg')) {
      return '$imageName.svg';
    } else {
      return '$imageName.png';
    }
  }

  static String addColonToLabel(String label) {
    return "$label :";
  }

  static String getMonthName(int monthNumber) {
    List<String> months = [
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre'
    ];
    return months[monthNumber - 1];
  }

  static List<String> buildMonthYearsBetweenTwoDates(
      DateTime startDate, DateTime endDate) {
    List<String> dateTimes = [];
    DateTime current = startDate;
    while (current.difference(endDate).isNegative) {
      current = current.add(const Duration(days: 24));
      dateTimes.add("${getMonthName(current.month)}, ${current.year}");
    }
    dateTimes = dateTimes.toSet().toList();

    return dateTimes;
  }

  static double getWidthPercentSize(double percent) {
    double screenWidth = Sizes.safeBlockHorizontal! * 100;
    return (percent * screenWidth) / 100;
  }

  static double getHeightPercentSize(double percent) {
    double screenHeight = Sizes.safeBlockVertical! * 100;
    return (percent * screenHeight) / 100;
  }

  static double getToolbarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  static double getToolbarTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getDefaultHorSpaceFigma(BuildContext context) {
    return 20.w;
  }

  static sendToScreen(
      Widget widget, BuildContext context, ValueChanged<dynamic> setChange) {
    Get.to(() => widget)!.then(setChange);
  }

  static backToFinish(BuildContext context) {
    Get.back();
  }

  static formatTime(Duration d) =>
      d.toString().split('.').first.padLeft(8, "0");

  static closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }
}
