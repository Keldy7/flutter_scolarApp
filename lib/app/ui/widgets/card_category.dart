import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/widget_utils.dart';
import '../styles/colors.dart';

class CardCategory extends StatelessWidget {
  final String title;
  final String nameSvg;
  final Function? onTapWigdet;
  const CardCategory({
    Key? key,
    required this.title,
    required this.nameSvg,
    this.onTapWigdet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: lightAccentColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: shadowLigthColor,
              ),
            ],
          ),
          child: Material(
            color: transparentColor,
            child: InkWell(
              onTap: () {
                if (onTapWigdet != null) {
                  onTapWigdet?.call();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 50,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: accentColor),
                    ),
                    child: getSvgImageWithSize(
                      color: accentColor,
                      context,
                      nameSvg,
                      25.h,
                      25.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  8.w.horizontalSpace,
                  Expanded(
                    child: getCustomFont(
                      title,
                      14,
                      getFontColor(context),
                      2,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ).paddingAll(7),
            ),
          ),
        ),
      );
    });
  }
}
