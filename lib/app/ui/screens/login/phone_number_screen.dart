// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../utils/constant.dart';
// import '../../../utils/routes.dart';
// import '../../../utils/widget_utils.dart';
// import '../../styles/colors.dart';


// class PhoneNumberScreen extends StatefulWidget {
//   const PhoneNumberScreen({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _PhoneNumberScreen();
//   }
// }

// class _PhoneNumberScreen extends State<PhoneNumberScreen> {
//   backClick(BuildContext context) {
//     Constant.backToFinish(context);
//   }

//   TextEditingController numberController = TextEditingController();
//   TextEditingController passController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Constant.setupSize(context);

//     double horSpace = Constant.getDefaultHorSpaceFigma(context);
//     return buildTitleDefaultWidget(context, "Enter your phonenumber",
//         "You will receive 4 digits number to\nverified number", () {
//       backClick(context);
//     },
//         Column(
//           children: [
//             getDefaultTextFiledWithCustomPrefix(
//                 context,
//                 "Phone number",
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
//             getButtonFigma(context, getAccentColor(context), true, "Continue",
//                 Colors.white, () {
//               Constant.goToNextPage(context, Routes.verificationScreenRoute);
//             }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 30.h)),
//           ],
//         ));
//   }
// }
