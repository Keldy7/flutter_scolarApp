// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../utils/constant.dart';
// import '../../../utils/label_keys.dart';
// import '../../../utils/routes.dart';
// import '../../../utils/widget_utils.dart';
// import '../../styles/colors.dart';


// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _ForgotPasswordScreen();
//   }
// }

// class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
//   backClick(BuildContext context) {
//     Constant.backToFinish(context);
//   }

//   TextEditingController numberController = TextEditingController();
//   TextEditingController passController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Constant.setupSize(context);

//     double horSpace = Constant.getDefaultHorSpaceFigma(context);
//     return buildTitleDefaultWidget(context, Labels.forgetPasswordKey,
//         Labels.numeroForgotPasswordKey, () {
//       backClick(context);
//     },
//         Column(
//           children: [
//             getDefaultTextFiledWithCustomPrefix(
//                 context,
//                 Labels.numTelephoneKey,
//                 numberController,
//                 getFontColor(context),
//                 CountryCodePicker(
//                   onChanged: print,
//                   initialSelection: 'CI',
//                   flagWidth: 40.h,
//                   padding: EdgeInsets.zero,
//                   textStyle: buildTextStyle(
//                       context, getFontColor(context), FontWeight.w400, 16.sp),
//                   favorite: const ['+225', 'CI'],
//                   showCountryOnly: false,
//                   showDropDownButton: true,
//                   showOnlyCountryWhenClosed: false,
//                   alignLeft: false,
//                 ).marginOnly(left: 20.w)),
//             getButtonFigma(
//                 context, getAccentColor(context), true, Labels.validerKey, Colors.white,
//                 () {
//               Constant.goToNextPage(context, Routes.resetPassRoute);
//             }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 30.h)),
//           ],
//         ));
//   }
// }
