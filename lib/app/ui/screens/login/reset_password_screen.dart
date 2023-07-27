import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/utils/image_keys.dart';

import '../../../utils/label_keys.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/bottom_selection_controller.dart';
import '../../controllers/home_controller.dart';
import '../../styles/colors.dart';


// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  backClick(BuildContext context) {
    Constant.backToFinish(context);
  }

  ResetPasswordScreen({super.key});

  RxBool showPass = false.obs;
  RxBool showPass2 = false.obs;

  TextEditingController passController = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(context, Labels.modifierPasswordKey,
        Labels.advicePasswordKey, () {
      backClick(context);
    },
        Column(
          children: [
            ObxValue((p0) {
              return getPassTextFiled(context, Labels.passwordKey, passController,
                  getFontColor(context), showPass.value, () {
                showPass.value = !showPass.value;
              });
            }, showPass),
            20.h.verticalSpace,
            ObxValue((p0) {
              return getPassTextFiled(context, Labels.confirmPasswordKey,
                  pass2Controller, getFontColor(context), showPass2.value, () {
                showPass2.value = !showPass2.value;
              });
            }, showPass2),
            getButtonFigma(
                context, getAccentColor(context), true, Labels.submitKey, primaryColor,
                () {
              showGetDialog(context, Images.donePng, Labels.changedPasswordKey,
                  Labels.changeSuccessPasswordKey, Labels.okKey, () {
                backClick(context);

                var controller = Get.find<HomeController>();
                var bottomNavController =
                    Get.find<BottomItemSelectionController>();
                bottomNavController.changePos(0);

                (!controller.fromDetail)
                    ? Constant.goToNextPage(context, Routes.loginRoute)
                    : Constant.goToNextPage(context, Routes.homeScreenRoute);
              });
            }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 40.h)),
          ],
        ));
  }
}
