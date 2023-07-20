import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/storage.dart';
import '../../styles/colors.dart';


class VerificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerificationScreen();
  }
}

class _VerificationScreen extends State<VerificationScreen> {
  backClick(BuildContext context) {
    Constant.backToFinish(context);
  }

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(
        context, "Verification", "We sent to the 01*******5", () {
      backClick(context);
    },
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // PinCodeFields(
            //   enabled: true,
            //   controller: otpController,
            //   autofocus: true,
            //   onComplete: (value) {},
            //   padding: EdgeInsets.symmetric(horizontal: horSpace),
            //   textStyle: buildTextStyle(
            //       context, getFontColor(context), FontWeight.w700, 25),
            //   fieldHeight: 60.h,
            //   fieldWidth: 79.h,
            //   responsive: false,
            //   margin: EdgeInsets.symmetric(horizontal: 10.w),
            //   activeBorderColor: getAccentColor(context),
            //   fieldBorderStyle: FieldBorderStyle.square,
            //   borderWidth: 1.h,
            //   borderRadius: BorderRadius.all(Radius.circular(11.h)),
            //   borderColor: getCurrentTheme(context).hintColor,
            // ),
            
            getButtonFigma(context, getAccentColor(context), true, "Confirm ",
                Colors.white, () {
              // if (otpController.text.isNotEmpty) {
              // Constant.sendToNext(context, resetPassRoute);
              showGetDialog(
                  context,
                  "confirm1.png",
                  "Confirmed !",
                  "You have been sucessfully\ncompleted for Sign in",
                  "Done", () {
                Get.back();
                setLoggedIn(true);
                Constant.goToNextPage(context, Routes.homeScreenRoute);
              }, dialogHeight: 465, imgWidth: 170, imgHeight: 162);
              // }
            }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 30.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getCustomFont(
                  "Don’t receive code?",
                  16,
                  getFontBlackColor(context),
                  1,
                  fontWeight: FontWeight.w400,
                ),
                getCustomFont(
                  " Resend",
                  18,
                  getFontBlackColor(context),
                  1,
                  fontWeight: FontWeight.w700,
                )
              ],
            )
          ],
        ));
  }
}
