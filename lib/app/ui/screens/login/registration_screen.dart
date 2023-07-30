import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/label_keys.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../styles/colors.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  backClick(BuildContext context) {
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    RxBool showPass = false.obs;
    RxBool showPass2 = false.obs;
    RxBool agreeTerm = false.obs;

    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController pass2Controller = TextEditingController();

    Constant.setupSize(context);

    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(context, Labels.createAccountKey, "", () {
      backClick(context);
    },
        Column(
          children: [
            getDefaultTextFiled(context, Labels.nomKey, nameController,
                getFontColor(context), (value) {}),
            20.h.verticalSpace,
            getDefaultTextFiled(context, Labels.adrMailKey, emailController,
                getFontColor(context), (value) {}),
            20.h.verticalSpace,
            ObxValue((p0) {
              return getPassTextFiled(context, Labels.passwordKey,
                  passController, getFontColor(context), showPass.value, () {
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
            20.h.verticalSpace,
            Row(
              children: [
                ObxValue((p0) {
                  return Checkbox(
                    visualDensity: VisualDensity.compact,
                    side:
                        BorderSide(color: secondaryColor, width: 1.h),
                    activeColor: secondaryColor,
                    onChanged: (value) {
                      agreeTerm.value = value!;
                    },
                    value: agreeTerm.value,
                  );
                }, agreeTerm),
                getCustomFont(Labels.agreeWithKey, 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.start),
                TextButton(
                  onPressed: () {
                    Constant.goToNextPage(context, Routes.termNConditionScreenRoute);
                  },
                  child: getCustomFont(
                      Labels.termsConditionsKey, 16, getAccentColor(context), 1,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start),
                )
              ],
            ).paddingSymmetric(horizontal: horSpace),
            30.h.verticalSpace,
            getButtonFigma(
                context, getAccentColor(context), true, Labels.sinscrireKey, primaryColor,
                () {
              Constant.goToNextPage(context, Routes.phoneNumberRoute);
            }, EdgeInsets.symmetric(horizontal: horSpace)),
            30.h.verticalSpace,
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
            50.h.verticalSpace,
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
                    Constant.goToNextPage(context, Routes.loginRoute);
                  },
                  child: getCustomFont(
                   Labels.connexionKey,
                    18,
                    getFontBlackColor(context),
                    1,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline
                  ),
                )
              ],
            )
          ],
        ));
  }
}
