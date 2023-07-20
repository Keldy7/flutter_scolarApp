import 'package:flutter/material.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
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
    return getScreenDetailDefaultView(context, "presence", () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * (0.075)),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.075),
                                    offset: const Offset(2.5, 2.5),
                                    blurRadius: 5,
                                    spreadRadius: 0)
                              ],
                              color: Theme.of(context).scaffoldBackgroundColor),
                          width: MediaQuery.of(context).size.width * (0.85),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${Constant.getMonthName(focusedDay.month)} ${focusedDay.year}",
                                  style: TextStyle(
                                      color: black40Color,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
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
                              color: Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    color: black40Color.withOpacity(0.075),
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
                            daysOfWeekHeight: 40,
                            enabledDayPredicate: (day) => !_isWeekend(day),
                            onPageChanged: (DateTime dateTime) {
                              setState(() {
                                focusedDay = dateTime;
                              });
                            },
                            onCalendarCreated: (contoller) {
                              calendarPageController = contoller;
                            },
                            calendarStyle: CalendarStyle(
                              isTodayHighlighted: false,
                              holidayTextStyle: TextStyle(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              holidayDecoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              selectedDecoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.error),
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
                                color: black40Color,
                                fontWeight: FontWeight.bold,
                              ),
                              weekendStyle: TextStyle(
                                color: greyFontColor,
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
                      ],
                    )),
              ],
            ))
          ],
        ));
  }
}
