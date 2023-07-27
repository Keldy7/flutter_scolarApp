import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/utils/image_keys.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/image_controller.dart';
import '../../styles/colors.dart';


class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomController =
        TextEditingController(text: "Kouassy");
    TextEditingController prenomController =
        TextEditingController(text: "Audy");
    TextEditingController phoneController =
        TextEditingController(text: "+225 01 41 541 253");
    TextEditingController emailController =
        TextEditingController(text: "audyKouassy58@gmail.com");

    var imageController = Get.find<ImageController>();

    Constant.setupSize(context);

    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: horSpace);

    return getScreenDetailDefaultView(context, Labels.monProfilKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: Column(
              children: [
                50.h.verticalSpace,
                Obx(() => getCircleImage(
                  context,
                  (imageController.imagePath.value.isNotEmpty)
                      ? imageController.imagePath.value
                      : Images.userPng,
                  100.h,
                  fileImage: (imageController.imagePath.value.isNotEmpty),
                ),),
                20.h.verticalSpace,
                getCustomFont('Kouassy Audy', 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w500),
                3.h.verticalSpace,
                getCustomFont('CI', 14, getFontColor(context), 1,
                    fontWeight: FontWeight.w700),
                40.h.verticalSpace,
                getDefaultUnderlineTextFiled(context, Labels.nomKey, nomController,
                    getFontHint(context), (value) {}),
                16.h.verticalSpace,
                getDefaultUnderlineTextFiled(context, Labels.prenomsKey,
                    prenomController, getFontHint(context), (value) {}),
                16.h.verticalSpace,
                getDefaultUnderlineTextFiled(context, Labels.numTelephoneKey,
                    phoneController, getFontHint(context), (value) {}),
                16.h.verticalSpace,
                getDefaultUnderlineTextFiled(context, Labels.adrMailKey,
                    emailController, getFontHint(context), (value) {}),
              ],
            )),
            getButtonFigma(context, getAccentColor(context), true,
                    Labels.editProfilKey, primaryColor, () {
              Constant.goToNextPage(context, Routes.editProfileRoute);
            }, edgeInsets)
                .marginSymmetric(vertical: 30.h)
          ],
        ));
  }
}
