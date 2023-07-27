import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/constant.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

import '../../../utils/label_keys.dart';

class EditChildScreen extends StatefulWidget {
  const EditChildScreen({super.key});

  @override
  State<EditChildScreen> createState() => _EditChildScreenState();
}

class _EditChildScreenState extends State<EditChildScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return getScreenDetailDefaultView(
      context,
      Labels.profilEnfantKey,
      () {
        Constant.backToPrev(context);
      },
      Column(children: [
        Expanded(
            child: ListView(
          shrinkWrap: true,
          children: [
            20.h.verticalSpace,
            Container(
                height: height * 0.5,
                width: width,
                decoration: getButtonDecoration(getCardColor(context),
                    withCorners: true,
                    corner: 20.h,
                    withBorder: true,
                    borderColor: secondaryColor,
                    shadow: [
                      const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                          offset: Offset(-4, 5),
                          blurRadius: 16)
                    ]),
                child: Column(
                  children: [
                    buildTitle(context, "Informations sur l'identité")
                    
                  ],
                ).paddingSymmetric(horizontal: 10, vertical: 10))
          ],
        ))
      ]).paddingSymmetric(horizontal: 15),
    );
  }
}
