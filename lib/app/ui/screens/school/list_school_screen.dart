import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/image_keys.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/value_selection_controller.dart';
import '../../models/model_category.dart';
import '../../styles/colors.dart';

class SchoolListScreen extends StatelessWidget {
  final List<ModelCategory> categoryList = FakeData.getAllCategoryList();

  final List<String> images = [
    Images.intro1Png,
    Images.intro2Png,
    Images.intro3Png,
    Images.intro4Png
  ];

  SchoolListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    var selectionController = Get.find<ValueSelectionController>();
    Constant.setupSize(context);

    return getScreenDetailDefaultView(
        context, selectionController.selectedTitle.value, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            30.h.verticalSpace,
            getDefaultTextFiled(
              context,
              Labels.rechercherKey,
              searchController,
              getFontColor(context),
              (value) {},
              withPrefix: true,
              imgNamePrefix: Images.searchSvg,
              isFilled: false,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shrinkWrap: true,
                itemCount: (images.length),
                itemBuilder: (context, index) {
                  return buildItemNearestSchoolDetail(context, () {
                    Constant.goToNextPage(
                        context, Routes.ecoleDetailScreenRoute);
                  }, img: images[index]);
                },
              ),
            )
          ],
        ),
        centerTitle: true);
  }
}
