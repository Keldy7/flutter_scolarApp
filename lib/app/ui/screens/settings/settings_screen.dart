import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/home_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                }, Labels.changerPasswordKey,
                    iconName: Icons.lock_person_rounded),
                getProfileRowContainer(context, () {
                  Constant.goToNextPage(context, Routes.termNCondition);
                }, Labels.termsConditionsKey,
                    iconName: Icons.auto_stories_rounded),
                getProfileRowContainer(context, () async {
                  await Constant.shareApp("http://www.google.com");
                }, Labels.politiqueConfidentialiteKey,
                    iconName: Icons.security),
                getProfileRowContainer(context, () {
                  Constant.goToNextPage(
                      context, Routes.notificationScreenRoute);
                }, Labels.notificationsKey,
                    iconName: Icons.notifications_rounded),
                // getProfileRowContainer(context, () async {
                //   await Constant.shareApp("http://www.google.com");
                // }, Labels.aboutUsKey, iconName: Icons.info_outline_rounded),
                getProfileRowContainer(context, () {}, Labels.shareAppKey,
                    iconName: Icons.share_outlined),
                getProfileRowContainer(context, () {
                  Constant.goToNextPage(context, Routes.helpCenterScreenRoute);
                }, Labels.helpCenterKey, iconName: Icons.help_rounded),
              ],
            )),
          ],
        ));
  }
}
