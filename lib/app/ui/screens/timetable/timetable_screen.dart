import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:time_planner/time_planner.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  //date of today
  int dateToday = DateTime.now().day - 1;
  bool isToday = false;
  @override
  Widget build(BuildContext context) {
    final innerWidth = MediaQuery.sizeOf(context).width;
    return getScreenDetailDefaultView(
      context,
      Labels.timetableKey,
      () {
        Constant.backToPrev(context);
      },
      Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.h.verticalSpace,
                    getCustomFont(DateFormat("EEE dd, MMM yyyy", Labels.langLocaleKey).format(DateTime.now()), 20, blackColor, 1),
                    5.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var i = DateTime.monday; i <= DateTime.friday; i++)
                          Container(
                            width: 50,
                            height: 70,
                            decoration: (dateToday + i) == DateTime.now().day
                                ? BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.green.withAlpha(50)),
                                    ],
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.green,
                                  )
                                : const BoxDecoration(),
                            child: Column(
                              children: [
                                getCustomFont(
                                    Constant.getDayName(i), 15, blackColor, 1),
                                10.h.verticalSpace,
                                getCustomFont(
                                    "${dateToday + i}", 20, blackColor, 1)
                              ],
                            ).paddingAll(8),
                          )
                      ],
                    ),
                    5.h.verticalSpace,
                    getDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("07.15", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont("Anglais", 15, primaryColor, 2,
                                  fontWeight: FontWeight.w500),
                              Row(
                                children: [
                                  getCustomFont("M. Koué, +225 01 01 765 432",
                                      11, greyColor, 2)
                                ],
                              ).paddingOnly(left: 0.0, top: 5),
                            ],
                          ).paddingAll(8),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    20.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("09.00", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont(
                                  "Cours géneral", 15, primaryColor, 2,
                                  fontWeight: FontWeight.w500),
                              Row(
                                children: [
                                  getCustomFont(
                                      "Mme. Touwan Julie, +225 01 01 765 432",
                                      11,
                                      greyColor,
                                      2)
                                ],
                              ).paddingOnly(left: 0.0, top: 5),
                            ],
                          ).paddingAll(8),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    20.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomFont("10.15", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          width: innerWidth * .8,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: getAccentColor(context),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getCustomFont("Récréation", 15, primaryColor, 1,
                                      fontWeight: FontWeight.w500)
                                  .paddingAll(8),
                            ],
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    20.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("09.00", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: blackColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont(
                                  "Cours géneral", 15, primaryColor, 2,
                                  fontWeight: FontWeight.w500),
                              Row(
                                children: [
                                  getCustomFont(
                                      "Mme. Touwan Julie, +225 01 01 765 432",
                                      11,
                                      greyColor,
                                      2)
                                ],
                              ).paddingOnly(left: 0.0, top: 5),
                            ],
                          ).paddingAll(8),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    20.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("09.00", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: blackColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont(
                                  "Cours géneral", 15, primaryColor, 2,
                                  fontWeight: FontWeight.w500),
                              Row(
                                children: [
                                  getCustomFont(
                                      "Mme. Touwan Julie, +225 01 01 765 432",
                                      11,
                                      greyColor,
                                      2)
                                ],
                              ).paddingOnly(left: 0.0, top: 5),
                            ],
                          ).paddingAll(8),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    20.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("12.00", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          width: innerWidth * .8,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: getAccentColor(context),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getCustomFont("Pause déjeuner et repos", 15, primaryColor, 1,
                                      fontWeight: FontWeight.w500)
                                  .paddingAll(8),
                            ],
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    20.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("14.00", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: blackColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont(
                                  "Cours géneral", 15, primaryColor, 2,
                                  fontWeight: FontWeight.w500),
                              Row(
                                children: [
                                  getCustomFont(
                                      "Mme. Touwan Julie, +225 01 01 765 432",
                                      11,
                                      greyColor,
                                      2)
                                ],
                              ).paddingOnly(left: 0.0, top: 5),
                            ],
                          ).paddingAll(8),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    20.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("15.30", 15, blackColor, 1,
                            fontWeight: FontWeight.w500),
                        10.w.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withAlpha(50)),
                            ],
                            color: blackColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont(
                                  "Cours géneral", 15, primaryColor, 2,
                                  fontWeight: FontWeight.w500),
                              Row(
                                children: [
                                  getCustomFont(
                                      "Mme. Touwan Julie, +225 01 01 765 432",
                                      11,
                                      greyColor,
                                      2)
                                ],
                              ).paddingOnly(left: 0.0, top: 5),
                            ],
                          ).paddingAll(8),
                        ),
                      ],
                    ).paddingOnly(top: 20.0),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "20.00",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Go to the gym for muscle",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.0, top: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.circle_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Weight training with Rock",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 64),
                                child: CircularPercentIndicator(
                                  radius: 20.0,
                                  lineWidth: 4.0,
                                  percent: 0.0,
                                  center: const Text(
                                    "0%",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 15),
    );
  }
}
