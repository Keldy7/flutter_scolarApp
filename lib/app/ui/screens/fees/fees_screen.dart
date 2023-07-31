import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, Labels.feeKey, () {
      Constant.backToPrev(context);
    }, Column(
      children: [
        Expanded(child: ListView(
          shrinkWrap: true,
          children: [
                20.h.verticalSpace,
                Text("Scolarité")

          ],
        ))
      ],
    ).paddingSymmetric(horizontal: 15),
        centerTitle: true);
  }
}