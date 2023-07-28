import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/home_controller.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return getScreenDetailDefaultView(context, Labels.reglagesKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: Column(
              children: [
                30.h.verticalSpace,
                getProfileRowContainer(context, () {
                  var controller = Get.find<HomeController>();
                  controller.fromDetail = true;
                  Constant.goToNextPage(context, Routes.resetPassRoute);
                }, Labels.changerPasswordKey),
                getProfileRowContainer(context, () {
                  Constant.goToNextPage(context, Routes.termNCondition);
                }, Labels.termsConditionsKey),
                getProfileRowContainer(context, () async {
                  await launchUrl(
                    Uri.parse("http://www.google.com"),
                    mode: LaunchMode.externalApplication,
                  );
                }, Labels.politiqueConfidentialiteKey),
                getProfileRowContainer(context, () {
                  Constant.goToNextPage(
                      context, Routes.notificationScreenRoute);
                }, Labels.notificationsKey),
                getProfileRowContainer(context, () async {
                  await launchUrl(
                    Uri.parse("http://www.google.com"),
                    mode: LaunchMode.externalApplication,
                  );
                }, Labels.aboutUsKey),
                getProfileRowContainer(context, () {
                  Constant.goToNextPage(
                      context, Routes.helpCenterScreenRoute);
                }, Labels.helpCenterKey),
              ],
            )),
          ],
        ));
  }
}
