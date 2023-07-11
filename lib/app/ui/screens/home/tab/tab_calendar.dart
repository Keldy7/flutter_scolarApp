import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/widget_utils.dart';

class TabCalendar extends StatelessWidget {
  const TabCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        getToolbarTopViewHeight(context).verticalSpace,
        20.h.verticalSpace,
        Center(
          child : Text("Tab Calendar"),
        )
        ],
    );
  }
}