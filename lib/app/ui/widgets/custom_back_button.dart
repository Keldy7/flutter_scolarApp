// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomBackButton extends StatelessWidget {
//   const CustomBackButton({super.key, this.onTapIcon});
//   final Function? onTapIcon;


//   @override
//   Widget build(BuildContext context) {
//     return const InkWell(
//       onTap: () {
//         if (onTapIcon != null) {
//                 onTapIcon?.call();
//               } else {
//                 Navigator.of(context).pop();
//               }
//       },
//       child: Icon(
//         Icons.arrow_back_ios_new_rounded,
//         size: 24.h,
//         color: colors,
//       ));
//   }
// }