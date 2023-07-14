import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/widget_utils.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        getToolbarTopViewHeight(context).verticalSpace,
        20.h.verticalSpace,
        const Center(
          child : Text("Tab Profile"),
        )
        ],
    );
  }
}