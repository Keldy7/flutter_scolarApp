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
                children: <Widget>[
                  Container(
                    height: 43,
                    width: 44,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: accentColor),
                    ),
                    child: getSvgImageWithSize(
                      color: accentColor,
                      context,
                      nameSvg,
                      24.h,
                      24.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
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
