import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/bottom_selection_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/value_selection_controller.dart';
import '../../styles/colors.dart';
import '../../widgets/custom_child_identity_bloc.dart';

class ChildrenScreen extends StatefulWidget {
  const ChildrenScreen({super.key});

  @override
  State<ChildrenScreen> createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen> {
  @override
  Widget build(BuildContext context) {
    var selectionController = Get.find<ValueSelectionController>();

    return getScreenDetailDefaultView(context, selectionController.selectedTitle.value, () {
      var controller = Get.find<HomeController>();
      var bottomNavController = Get.find<BottomItemSelectionController>();
      bottomNavController.changePos(0);

      (!controller.fromDetail) ==
          Constant.goToNextPage(context, Routes.homeScreenRoute);
    },
        Column(
          children: [
            Expanded(
                flex: 1,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    20.h.verticalSpace,
                    LayoutBuilder(builder: (context, boxConstraints) {
                      return Wrap(
                          spacing: boxConstraints.maxWidth * (0.1),
                          runSpacing: 32.5,
                          children: [
                            CustomChildIdentityBloc(
                                width: boxConstraints.maxWidth * (0.45)),
                            CustomChildIdentityBloc(
                                width: boxConstraints.maxWidth * (0.45)),
                            CustomChildIdentityBloc(
                                width: boxConstraints.maxWidth * (0.45)),
                          ]);
                    })
                  ],
                )),
            getButtonFigma(
                context,
                secondaryColor,
                true,
                Labels.addEnfantKey,
                primaryColor,
                () {},
                EdgeInsets.only(bottom: 30.h, top: 7.h))
          ],
        ).paddingSymmetric(horizontal: 15),
        centerTitle: true);
  }
}
