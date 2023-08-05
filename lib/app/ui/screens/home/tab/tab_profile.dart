// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/label_keys.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/image_keys.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/widget_utils.dart';
import '../../../controllers/image_controller.dart';
import '../../../controllers/storage.dart';
import '../../../styles/colors.dart';

class TabProfile extends StatelessWidget {
  TabProfile({super.key});

  var imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return getScreenDetailDefaultView(
        context,
        Labels.profilKey,
        () {},
        Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  50.h.verticalSpace,
                  Obx(
                    () => getCircleImage(
                      context,
                      (imageController.imagePath.value.isNotEmpty)
                          ? imageController.imagePath.value
                          : Images.userPng,
                      100.h,
                      fileImage: (imageController.imagePath.value.isNotEmpty),
                    ),
                  ),
                  20.h.verticalSpace,
                  getCustomFont(
                      'Aude Marie Kouassy', 16, getFontColor(context), 1,
                      fontWeight: FontWeight.w700),
                  3.h.verticalSpace,
                  getCustomFont('aud@gmail.com', 14, getFontColor(context), 1,
                      fontWeight: FontWeight.w500),
                  30.h.verticalSpace,
                  getProfileRowContainer(context, () {
                    Constant.goToNextPage(context, Routes.myProfileScreenRoute);
                  }, Labels.monProfilKey,
                      iconName: Icons.manage_accounts_rounded),
                  getProfileRowContainer(context, () {
                    Constant.goToNextPage(
                        context, Routes.permissionsScreenRoute);
                  }, Labels.mesPermissionsKey,
                      iconName: Icons.compare_arrows_outlined),
                  getProfileRowContainer(context, () {
                    Constant.goToNextPage(context, Routes.settingScreenRoute);
                  }, Labels.reglagesKey, iconName: Icons.settings),
                ],
              ),
            ),
            getButtonFigma(context, getAccentColor(context), true,
                    Labels.deconnexionKey, primaryColor, () {
              setLoggedIn(false);
              Constant.goToNextPage(context, Routes.loginRoute);
            },
                    EdgeInsets.symmetric(
                        horizontal: Constant.getDefaultHorSpaceFigma(context)))
                .marginSymmetric(vertical: 30.h),
          ],
        ),
        withLeading: false);
  }
}
