import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/utils/constant.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../styles/colors.dart';

class ExamenScreen extends StatefulWidget {
  const ExamenScreen({super.key});

  @override
  State<ExamenScreen> createState() => _ExamenScreenState();
}

class _ExamenScreenState extends State<ExamenScreen> {
  final List<String> tabList = [Labels.examensKey, Labels.compositionsKey];

  @override
  Widget build(BuildContext context) {
    // RxInt selectedTab = 0.obs;

    return getScreenDetailDefaultView(context, Labels.examensCompositionsKey,
        () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                20.h.verticalSpace,
                //janv-feb text
                buildTitles(context, "Jan - Fev"),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    color: primaryColor,
                    shadowColor: shadowColor,
                    margin: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Constant.goToNextPage(
                            context, Routes.examsDetailScreenRoute);
                      },
                      child: SizedBox(
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 10,
                                color: secondaryColor,
                              ),
                              10.w.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    getCustomFont(
                                        "Titre compo", 16, blackColor, 2,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          size: 18.h,
                                          color: accentColor,
                                        ),
                                        8.w.horizontalSpace,
                                        getCustomFont(
                                            "Vendredi, 22 Juillet 2023",
                                            14,
                                            greyFontColor,
                                            1),
                                      ],
                                    ),
                                    5.h.verticalSpace,
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: 18.h,
                                          color: accentColor,
                                        ),
                                        8.w.horizontalSpace,
                                        getCustomFont(
                                            "09H - 11H", 14, greyFontColor, 1),
                                      ],
                                    ),
                                  ],
                                ).paddingOnly(top: 15, bottom: 15),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Assez-bien",
                                    maxLines: 2,
                                  ),
                                  5.h.verticalSpace,
                                ],
                              ).paddingOnly(right: 10)
                            ],
                          )),
                    ))
              ],
            ))
          ],
        ).paddingSymmetric(horizontal: 15));
  }
}
