import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/constant.dart';
import '../../widgets/change_calendar_month_button.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  //last and first day of calendar
  late DateTime firstDay = DateTime(2020);
  late DateTime lastDay = (DateTime.now());

  //current day
  late DateTime focusedDay = DateTime.now();
  PageController? calendarPageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // calendarPageController?.dispose();
    super.dispose();
  }

  bool _disableChangeNextMonthButton() {
    return focusedDay.year == DateTime.now().year &&
        focusedDay.month == DateTime.now().month;
  }

  bool _isWeekend(DateTime day) {
    return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
  }

  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, Labels.ponctualiteKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                20.h.verticalSpace,
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * (0.075)),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: black40Color.withOpacity(0.2),
                                    offset: const Offset(2.5, 2.5),
                                    blurRadius: 5,
                                    spreadRadius: 0)
                              ],
                              color: primaryColor),
                          width: MediaQuery.sizeOf(context).width * (0.85),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: getCustomFont(
                                      "${Constant.getMonthName(focusedDay.month)} ${focusedDay.year}",
                                      16,
                                      black40Color,
                                      1,
                                      fontWeight: FontWeight.w700)),
                              Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: ChangeCalendarMonthButton(
                                      onTap: () {
                                        calendarPageController?.previousPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeInOut);
                                      },
                                      isDisable: false,
                                      isNextButton: false)),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: ChangeCalendarMonthButton(
                                    onTap: () {
                                      if (_disableChangeNextMonthButton()) {
                                        return;
                                      }
                                      calendarPageController?.nextPage(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut);
                                    },
                                    isDisable: _disableChangeNextMonthButton(),
                                    isNextButton: true),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              boxShadow: [
                                BoxShadow(
                                    color: black40Color.withOpacity(0.2),
                                    offset: const Offset(5.0, 5),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ],
                              borderRadius: BorderRadius.circular(15.0)),
                          margin: const EdgeInsets.only(top: 20),
                          child: TableCalendar(
                            locale: 'fr_FR',
                            calendarFormat: CalendarFormat.month,
                            headerVisible: false,
                            daysOfWeekHeight: 42,
                            enabledDayPredicate: (day) => !_isWeekend(day),
                            onPageChanged: (DateTime dateTime) {
                              setState(() {
                                focusedDay = dateTime;
                              });
                            },
                            onCalendarCreated: (contoller) {
                              calendarPageController = contoller;
                            },

                            //Style calendar
                            calendarStyle: CalendarStyle(
                              isTodayHighlighted: true,
                              todayDecoration: BoxDecoration(
                                color: secondaryColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              holidayTextStyle: TextStyle(color: blackColor),
                              holidayDecoration: BoxDecoration(
                                  shape: BoxShape.circle, color: accentColor),
                              selectedDecoration: BoxDecoration(
                                  shape: BoxShape.circle, color: redColor),
                              selectedTextStyle: TextStyle(
                                color: primaryColor,
                              ),
                              // selectedDecoration: BoxDecoration(
                              //   shape: BoxShape.circle,
                              //   color: secondaryColor,
                              // ),
                              defaultTextStyle: TextStyle(
                                color: black40Color,
                              ),
                            ),
                            daysOfWeekStyle: DaysOfWeekStyle(
                              weekdayStyle: TextStyle(
                                color: getAccentColor(context),
                                fontWeight: FontWeight.bold,
                              ),
                              weekendStyle: TextStyle(
                                color: greyIconColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            headerStyle: const HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                            ),
                            firstDay: firstDay,
                            lastDay: lastDay,
                            focusedDay: focusedDay,
                            availableGestures: AvailableGestures.none,
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() => this.focusedDay = selectedDay);
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * (0.05),
                        ),
                        LayoutBuilder(builder: (context, boxConstraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildAttendanceCounterContainer(
                                  boxConstraints: boxConstraints,
                                  title: Labels.totalPresentKey,
                                  value: "8",
                                  // value: presentDays.length.toString(),
                                  backgroundColor: greenColor),
                              const Spacer(),
                              _buildAttendanceCounterContainer(
                                  boxConstraints: boxConstraints,
                                  title: Labels.totalAbsentKey,
                                  value: "2",
                                  backgroundColor: redColor),
                            ],
                          );
                        })
                      ],
                    )),
              ],
            ))
          ],
        ));
  }

  Widget _buildAttendanceCounterContainer(
      {required String title,
      required BoxConstraints boxConstraints,
      required String value,
      required Color backgroundColor}) {
    return Container(
      height: boxConstraints.maxWidth * (0.425),
      width: boxConstraints.maxWidth * (0.425),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
              color: blackColor.withOpacity(0.25),
              offset: const Offset(5, 5),
              blurRadius: 10,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getCustomFont(title, 15, primaryColor, 1,
              fontWeight: FontWeight.w700),
          SizedBox(
            height: boxConstraints.maxWidth * (0.45) * (0.125),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: primaryColor,
            child: Center(
              child: getCustomFont(value, 18, backgroundColor, 1,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
