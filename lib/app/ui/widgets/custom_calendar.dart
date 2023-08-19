import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/constant.dart';
import '../../utils/label_keys.dart';
import '../../utils/widget_utils.dart';
import '../styles/colors.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar(
      {Key? key,
      this.initialStartDate,
      this.initialEndDate,
      this.startEndDateChange,
      this.minimumDate,
      this.maximumDate})
      : super(key: key);

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  final Function(DateTime, DateTime)? startEndDateChange;

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  List<DateTime> dateList = <DateTime>[];

  DateTime currentMonthDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setListOfDate(DateTime monthDate) {
    dateList.clear();
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;
    if (newDate.weekday < 7) {
      previousMothDay = newDate.weekday;
      for (int i = 1; i <= previousMothDay; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
    }
    for (int i = 0; i < (42 - previousMothDay); i++) {
      dateList.add(newDate.add(Duration(days: i + 1)));
    }
    // if (dateList[dateList.length - 7].month != monthDate.month) {
    //   dateList.removeRange(dateList.length - 7, dateList.length);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  border: Border.all(
                    color: dividerColor,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    onTap: () {
                      setState(() {
                        currentMonthDate = DateTime(
                            currentMonthDate.year, currentMonthDate.month, 0);
                        setListOfDate(currentMonthDate);
                      });
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: greyColor,
                    ),
                  ),
                ),
              ).paddingAll(8),
              Expanded(
                child: Center(
                    child: getCustomFont(
                        "${Constant.getMonthName(currentMonthDate.month)} ${currentMonthDate.year}",
                        20,
                        blackColor,
                        1,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  border: Border.all(
                    color: dividerColor,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    onTap: () {
                      setState(() {
                        currentMonthDate = DateTime(currentMonthDate.year,
                            currentMonthDate.month + 2, 0);
                        setListOfDate(currentMonthDate);
                      });
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: greyColor,
                    ),
                  ),
                ),
              ).paddingAll(8.0),
            ],
          ).paddingOnly(left: 8.0, right: 8.0, top: 4, bottom: 4),
          Row(
            children: getDaysOfWeekName(),
          ).paddingOnly(right: 8, left: 8, bottom: 8),
          Column(
            children: getDays(),
          ).paddingOnly(right: 8, left: 8),
        ],
      ),
    );
  }

  List<Widget> getDaysOfWeekName() {
    final List<Widget> listUI = <Widget>[];
    for (int i = 0; i < 7; i++) {
      listUI.add(
        Expanded(
          child: Center(
              child: getCustomFont(
                  DateFormat('EEE', Labels.langLocaleKey).format(dateList[i]),
                  16,
                  getAccentColor(context),
                  1,
                  fontWeight: FontWeight.w500)),
        ),
      );
    }
    return listUI;
  }

  List<Widget> getDays() {
    final List<Widget> noList = <Widget>[];
    int counter = 0;
    for (int i = 0; i < dateList.length / 7; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < 7; i++) {
        final DateTime date = dateList[counter];
        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: startDate != null && endDate != null
                              ? getIsItStartAndEndDate(date) ||
                                      getIsInRange(date)
                                  ? secondaryColor.withOpacity(0.4)
                                  : Colors.transparent
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: isStartDateRadius(date)
                                ? const Radius.circular(24.0)
                                : const Radius.circular(0.0),
                            topLeft: isStartDateRadius(date)
                                ? const Radius.circular(24.0)
                                : const Radius.circular(0.0),
                            topRight: isEndDateRadius(date)
                                ? const Radius.circular(24.0)
                                : const Radius.circular(0.0),
                            bottomRight: isEndDateRadius(date)
                                ? const Radius.circular(24.0)
                                : const Radius.circular(0.0),
                          ),
                        ),
                      ).paddingOnly(
                          top: 2,
                          bottom: 2,
                          left: isStartDateRadius(date) ? 4 : 0,
                          right: isEndDateRadius(date) ? 4 : 0),
                    ).paddingOnly(top: 3, bottom: 3),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32.0)),
                        onTap: () {
                          if (currentMonthDate.month == date.month) {
                            if (widget.minimumDate != null &&
                                widget.maximumDate != null) {
                              final DateTime newminimumDate = DateTime(
                                  widget.minimumDate!.year,
                                  widget.minimumDate!.month,
                                  widget.minimumDate!.day - 1);
                              final DateTime newmaximumDate = DateTime(
                                  widget.maximumDate!.year,
                                  widget.maximumDate!.month,
                                  widget.maximumDate!.day + 1);
                              if (date.isAfter(newminimumDate) &&
                                  date.isBefore(newmaximumDate)) {
                                onDateClick(date);
                              }
                            } else if (widget.minimumDate != null) {
                              final DateTime newminimumDate = DateTime(
                                  widget.minimumDate!.year,
                                  widget.minimumDate!.month,
                                  widget.minimumDate!.day - 1);
                              if (date.isAfter(newminimumDate)) {
                                onDateClick(date);
                              }
                            } else if (widget.maximumDate != null) {
                              final DateTime newmaximumDate = DateTime(
                                  widget.maximumDate!.year,
                                  widget.maximumDate!.month,
                                  widget.maximumDate!.day + 1);
                              if (date.isBefore(newmaximumDate)) {
                                onDateClick(date);
                              }
                            } else {
                              onDateClick(date);
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: getIsItStartAndEndDate(date)
                                ? secondaryColor
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32.0)),
                            border: Border.all(
                              color: getIsItStartAndEndDate(date)
                                  ? secondaryColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: getIsItStartAndEndDate(date)
                                ? [
                                    BoxShadow(
                                        color: greyColor.withOpacity(0.6),
                                        blurRadius: 4,
                                        offset: const Offset(0, 0)),
                                  ]
                                : null,
                          ),
                          child: Center(
                              child: getCustomFont(
                                  '${date.day}',
                                  MediaQuery.sizeOf(context).width > 360
                                      ? 18
                                      : 16,
                                  getIsItStartAndEndDate(date)
                                      ? primaryColor
                                      : currentMonthDate.month == date.month
                                          ? blackColor
                                          : greyColor.withOpacity(0.6),
                                  1,
                                  fontWeight: getIsItStartAndEndDate(date)
                                      ? FontWeight.bold
                                      : FontWeight.normal)),
                        ).paddingAll(2),
                      ),
                    ),
                    //Indicator for focused day
                    Positioned(
                      bottom: 7,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: DateTime.now().day == date.day &&
                                    DateTime.now().month == date.month &&
                                    DateTime.now().year == date.year
                                ? getIsInRange(date)
                                    ? getAccentColor(context)
                                    : getAccentColor(context)
                                : Colors.transparent,
                            shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        counter += 1;
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  bool getIsInRange(DateTime date) {
    if (startDate != null && endDate != null) {
      if (date.isAfter(startDate!) && date.isBefore(endDate!)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool getIsItStartAndEndDate(DateTime date) {
    if (startDate != null &&
        startDate!.day == date.day &&
        startDate!.month == date.month &&
        startDate!.year == date.year) {
      return true;
    } else if (endDate != null &&
        endDate!.day == date.day &&
        endDate!.month == date.month &&
        endDate!.year == date.year) {
      return true;
    } else {
      return false;
    }
  }

  bool isStartDateRadius(DateTime date) {
    if (startDate != null &&
        startDate!.day == date.day &&
        startDate!.month == date.month) {
      return true;
    } else if (date.weekday == 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isEndDateRadius(DateTime date) {
    if (endDate != null &&
        endDate!.day == date.day &&
        endDate!.month == date.month) {
      return true;
    } else if (date.weekday == 7) {
      return true;
    } else {
      return false;
    }
  }

  void onDateClick(DateTime date) {
    if (startDate == null) {
      startDate = date;
    } else if (startDate != date && endDate == null) {
      endDate = date;
    } else if (startDate!.day == date.day && startDate!.month == date.month) {
      startDate = null;
    } else if (endDate!.day == date.day && endDate!.month == date.month) {
      endDate = null;
    }
    if (startDate == null && endDate != null) {
      startDate = endDate;
      endDate = null;
    }
    if (startDate != null && endDate != null) {
      if (!endDate!.isAfter(startDate!)) {
        final DateTime d = startDate!;
        startDate = endDate;
        endDate = d;
      }
      if (date.isBefore(startDate!)) {
        startDate = date;
      }
      if (date.isAfter(endDate!)) {
        endDate = date;
      }
    }
    setState(() {
      try {
        widget.startEndDateChange!(startDate!, endDate!);
      } catch (_) {}
    });
  }
}
