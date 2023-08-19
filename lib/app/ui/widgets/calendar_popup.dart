import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/constant.dart';
import '../../utils/label_keys.dart';
import '../../utils/widget_utils.dart';
import '../styles/colors.dart';
import 'custom_calendar.dart';

class CalendarPopup extends StatefulWidget {
  const CalendarPopup(
      {Key? key,
      this.initialStartDate,
      this.initialEndDate,
      this.onApplyClick,
      this.onCancelClick,
      this.barrierDismissible = true,
      this.minimumDate,
      this.maximumDate})
      : super(key: key);

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  final bool barrierDismissible;

  final Function(DateTime, DateTime)? onApplyClick;
  final Function()? onCancelClick;

  @override
  _CalendarPopupState createState() => _CalendarPopupState();
}

class _CalendarPopupState extends State<CalendarPopup>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double horSpace = Constant.getDefaultHorSpaceFigma(context);

    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController!.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (widget.barrierDismissible) {
                    Get.back();
                  }
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      boxShadow: [
                        BoxShadow(
                            color: greyColor.withOpacity(0.2),
                            offset: const Offset(4, 4),
                            blurRadius: 8.0),
                      ],
                    ),
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Entetes
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    getCustomFont(Labels.duKey, 16, greyColor, 1,
                                        textAlign: TextAlign.left,
                                        fontWeight: FontWeight.w500),
                                    5.h.verticalSpace,
                                    getCustomFont(
                                        startDate != null
                                            ? DateFormat('EEE dd MMM',
                                                    Labels.langLocaleKey)
                                                .format(startDate!)
                                            : '--/-- ',
                                        16,
                                        blackColor,
                                        1,
                                        fontWeight: FontWeight.bold)
                                  ],
                                ),
                              ),
                              Container(
                                height: 75,
                                width: 1,
                                color: dividerColor,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    getCustomFont(Labels.auKey, 16, greyColor, 1,
                                        fontWeight: FontWeight.w500),
                                    5.h.verticalSpace,
                                    getCustomFont(
                                        endDate != null
                                            ? DateFormat('EEE dd MMM',
                                                    Labels.langLocaleKey)
                                                .format(endDate!)
                                            : '--/-- ',
                                        16,
                                        blackColor,
                                        1,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                              )
                            ],
                          ),
                          getDivider(),
                          //Calendar view
                          CustomCalendar(
                            minimumDate: widget.minimumDate,
                            maximumDate: widget.maximumDate,
                            initialEndDate: widget.initialEndDate,
                            initialStartDate: widget.initialStartDate,
                            startEndDateChange: (DateTime startDateData,
                                DateTime endDateData) {
                              setState(() {
                                startDate = startDateData;
                                endDate = endDateData;
                              });
                            },
                          ),
                          getButtonFigma(context, getAccentColor(context),
                              true, Labels.validerKey, primaryColor, () {
                            try {
                              // animationController.reverse().then((f) {});
                              widget.onApplyClick!(startDate!, endDate!);
                              Navigator.pop(context);
                            } catch (_) {}
                          },
                              EdgeInsets.only(
                                  left: horSpace,
                                  right: horSpace,
                                  top: 20.h,
                                  bottom: 20.h)),
                        ],
                      ),
                    ),
                  ).paddingAll(24),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
