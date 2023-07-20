import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/bottom_selection_controller.dart';
import '../../controllers/storage.dart';
import '../../styles/colors.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  backClick(BuildContext context) {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    RxBool showPass = false.obs;

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    Constant.setupSize(context);

    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(context, Labels.connexionKey, Labels.gladMeetKey,
        () {
      backClick(context);
    },
        Column(
          children: [
            getDefaultTextFiled(context, Labels.adrMailKey, emailController,
                getFontColor(context), (value) {}),
            20.h.verticalSpace,
            ObxValue((p0) {
              return getPassTextFiled(context, Labels.passwordKey, passController,
                  getFontColor(context), showPass.value, () {
                showPass.value = !showPass.value;
              });
            }, showPass),
            20.h.verticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Constant.goToNextPage(context, Routes.forgotPassRoute);
                },
                child: getCustomFont(
                    Labels.forgetPasswordKey, 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.end),
              ),
            ).paddingOnly(right: horSpace),
            getButtonFigma(
                context,
                getAccentColor(context),
                true,
                Labels.connexionKey,
                primaryColor,
                () {
                  final controller = Get.find<BottomItemSelectionController>();
                  controller.bottomBarSelectedItem.value=0;
                  setLoggedIn(true);
                  Constant.goToNextPage(context, Routes.homeScreenRoute);
                },
                EdgeInsets.symmetric(horizontal: horSpace, vertical: 40.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child:
                      getDivider(setColor: getCurrentTheme(context).hintColor),
                ),
                getCustomFont(Labels.orSignKey, 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.center),
                Expanded(
                  flex: 1,
                  child:
                      getDivider(setColor: getCurrentTheme(context).hintColor),
                )
              ],
            ).marginSymmetric(horizontal: horSpace),
            30.h.verticalSpace,
            getButtonFigma(
                context,
                getCardColor(context),
                true,
                Labels.googleSignKey,
                getFontColor(context),
                () {},
                EdgeInsets.zero,
                isIcon: true,
                icons: "Google.svg",
                shadow: [
                  const BoxShadow(
                      color: Color.fromRGBO(130, 164, 131, 0.2199999988079071),
                      offset: Offset(0, 7),
                      blurRadius: 33)
                ]).marginSymmetric(horizontal: horSpace, vertical: 10.h),
            getButtonFigma(
                context,
                getCardColor(context),
                true,
                Labels.facebookSignKey,
                getFontColor(context),
                () {},
                EdgeInsets.zero,
                isIcon: true,
                icons: "Facebook.svg",
                shadow: [
                  const BoxShadow(
                      color: Color.fromRGBO(130, 164, 131, 0.2199999988079071),
                      offset: Offset(0, 7),
                      blurRadius: 33)
                ]).marginSymmetric(horizontal: horSpace, vertical: 10.h),
            80.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getCustomFont(
                  Labels.alreadyAccountKey,
                  16,
                  getFontBlackColor(context),
                  1,
                  fontWeight: FontWeight.w400,
                ),
                InkWell(
                  onTap: () {
                    Constant.goToNextPage(context, Routes.registrationRoute);
                  },
                  child: getCustomFont(
                    Labels.sinscrireKey,
                    18,
                    getFontBlackColor(context),
                    1,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
