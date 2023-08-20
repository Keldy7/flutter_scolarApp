import 'package:flutter/material.dart';
import 'package:scolar_pay/app/utils/constant.dart';
// import 'package:time_planner/time_planner.dart';

import '../../../utils/widget_utils.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, "Emploi du temps", (){
        Constant.backToPrev(context);

    }, Column(
      children: [
        Text("Emploi du temps"),
        TimePlanner(
          startHour: 2,
          endHour: 24,
          headers: [
            TimePlannerTitle(
              date: "7/20/2021",
              title: "tuesday",
            ),
            TimePlannerTitle(
              date: "7/21/2021",
              title: "wednesday",
            ),
            TimePlannerTitle(
              date: "7/22/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "7/23/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "7/24/2021",
              title: "saturday",
            ),
            TimePlannerTitle(
              date: "7/25/2021",
              title: "sunday",
            ),
            TimePlannerTitle(
              date: "7/26/2021",
              title: "monday",
            ),
            TimePlannerTitle(
              date: "7/27/2021",
              title: "tuesday",
            ),
            TimePlannerTitle(
              date: "7/28/2021",
              title: "wednesday",
            ),
            TimePlannerTitle(
              date: "7/29/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "7/30/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "7/31/2021",
              title: "Saturday",
            ),
          ],
          tasks: tasks,
          style: TimePlannerStyle(
              showScrollBar: true
          ),
        ),
      
      ],
    ));
  }
}