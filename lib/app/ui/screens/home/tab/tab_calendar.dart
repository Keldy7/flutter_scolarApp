import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../utils/widget_utils.dart';
import '../../../styles/colors.dart';

class TabCalendar extends StatefulWidget {
  const TabCalendar({super.key});

  @override
  State<TabCalendar> createState() => _TabCalendarState();
}

class _TabCalendarState extends State<TabCalendar> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getToolbarTopViewHeight(context).verticalSpace,
        20.h.verticalSpace,
        const Center(
          child : Text("Tab Calendar"),
        ),
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0,
            color: greyFontColor,
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "object.title",
                                maxLines: 1,
                              ),
                            ),
                            Container(height: 5),
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("content", maxLines: 2),
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("6 juin", maxLines: 2),
                            ),
                            Container(height: 10),
                          ],
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.network(
                              "https://fluttergems.dev/media/logo.png"),
                        ),
                      ),
                    ],
                  )),
            ))
      ],
    );
  }
}
