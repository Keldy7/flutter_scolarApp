// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/widget_utils.dart';
import '../../../controllers/bottom_selection_controller.dart';
import '../../../controllers/image_controller.dart';
import '../../../controllers/storage.dart';
import '../../../styles/colors.dart';

class TabProfile extends StatelessWidget {

  TabProfile({super.key});

  final List profileList = ['My Profile', 'My Booking', 'Setting'];

  var imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return getScreenDetailDefaultView(
        context,
        'Profile',
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
                          : 'profile.jpg',
                      100.h,
                      fileImage: (imageController.imagePath.value.isNotEmpty),
                    ),
                  ),
                  20.h.verticalSpace,
                  getCustomFont('Kristin Watson', 16, getFontColor(context), 1,
                      fontWeight: FontWeight.w500),
                  3.h.verticalSpace,
                  getCustomFont('USA', 14, getFontColor(context), 1,
                      fontWeight: FontWeight.w700),
                  30.h.verticalSpace,
                  getProfileRowContainer(context, () {
                    Constant.goToNextPage(context, Routes.myProfileScreenRoute);
                  }, 'My Profile'),
                  getProfileRowContainer(context, () {
                    final controller =
                        Get.find<BottomItemSelectionController>();
                    controller.bottomBarSelectedItem.value = 2;
                    Constant.goToNextPage(context, Routes.homeScreenRoute);
                  }, 'My Booking'),
                  getProfileRowContainer(context, () {
                    Constant.goToNextPage(context, Routes.settingScreenRoute);
                  }, 'Settings'),
                ],
              ),
            ),
            getButtonFigma(context, getAccentColor(context), true, 'Log Out',
                    Colors.white, () {
              setLoggedIn(false);
              Constant.goToNextPage(context, Routes.loginRoute);
            },
                    EdgeInsets.symmetric(
                        horizontal:
                            Constant.getDefaultHorSpaceFigma(context)))
                .marginSymmetric(vertical: 30.h),
            130.h.verticalSpace,
          ],
        ),
        withLeading: false);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children:[
  //       getToolbarTopViewHeight(context).verticalSpace,
  //       20.h.verticalSpace,
  //       const Center(
  //         child : Text("Tab Profile"),
  //       )
  //       ],
  //   );
  // }
}