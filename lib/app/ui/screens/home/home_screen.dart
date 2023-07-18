import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/bottom_selection_controller.dart';
import '../../controllers/home_controller.dart';
import '../../models/model_bottom_nav.dart';
import '../../styles/colors.dart';
import '../../widgets/bottom_bar.dart';
import 'tab/tab_calendar.dart';
import 'tab/tab_home.dart';
import 'tab/tab_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  var controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  List<Widget> bottomViewList = [
    const TabHome(),
    const TabCalendar(),
    TabProfile(),
  ];
  List<ModelBottomNav> allBottomNavList = FakeData.getAllBottomNavList();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomItemSelectionController>();
    Constant.setupSize(context);
    double bottomNavHeight = 104.h;
    return Scaffold(
      backgroundColor: getAccentColor(context),
      extendBodyBehindAppBar: true,
      appBar: getInVisibleAppBar(color: Colors.transparent),
      body: Stack(
        children: [
          Obx(() => bottomViewList[controller.bottomBarSelectedItem.value]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: bottomNavHeight,
              decoration: ShapeDecoration(
                  shadows: const [
                    BoxShadow(
                        color: Color.fromRGBO(134, 93, 93, 0.1599999964237213),
                        offset: Offset(0, -2),
                        blurRadius: 20)
                  ],
                  color: getAccentColor(context),
                  shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.vertical(
                          top: SmoothRadius(
                              cornerRadius: 40.h, cornerSmoothing: 0.5)))),
              child: Obx(() => BottomBar(
                    onTap: (p0) {
                      controller.changePos(p0);
                    },
                    currentIndex: controller.bottomBarSelectedItem.value,
                    selectedItemColor: getAccentColor(context),
                    selectedColorOpacity: 1,
                    unselectedItemColor: getFontBlackColor(context),
                    itemShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(27.h))),
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
                    items: List.generate(allBottomNavList.length, (int index) {
                      ModelBottomNav allBottomNav = allBottomNavList[index];
                      return BottomBarItem(
                          title: getCustomFont(
                              allBottomNav.title, 14, primaryColor, 1,
                              fontWeight: FontWeight.w700),
                          icon: getSvgImageWithSize(
                              context, allBottomNav.icon, 24.h, 24.h,
                              fit: BoxFit.scaleDown,
                              color: getFontBlackColor(context)),
                          activeIcon: getSvgImageWithSize(
                              context, allBottomNav.activeIcon, 24.h, 24.h,
                              fit: BoxFit.scaleDown));
                    }),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
