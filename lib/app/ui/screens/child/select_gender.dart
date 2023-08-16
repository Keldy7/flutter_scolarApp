import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/image_keys.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/storage.dart';
import '../../styles/colors.dart';

class SelectGender extends StatelessWidget {
  SelectGender({super.key});

  final List genderImg = [Images.boyPng, Images.girlPng];

  @override
  Widget build(BuildContext context) {
    RxInt isSelected = 0.obs;

    return getScreenDetailDefaultView(
      context,
      'Select Gender',
      () {
        Constant.backToPrev(context);
      },
      Column(
        children: [
          30.h.verticalSpace,
          getMultilineCustomFont(
            'Please choose your gender. This \nwill be identify needs.',
            16,
            getFontColor(context),
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          30.h.verticalSpace,
          Container(
              height: 149.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: ObxValue(
                  (p0) => Row(
                      children: List.generate(
                          genderImg.length,
                          (index) => Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    isSelected.value = index;
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 23.h),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                        border: Border.all(
                                            color: (isSelected.value == index)
                                                ? getAccentColor(context)
                                                : indicatorColor,
                                            width: 2)),
                                    child: getAssetImage(
                                        context, genderImg[index], 102, 102),
                                  ),
                                ),
                              ))),
                  isSelected)),
          30.h.verticalSpace,
          getButtonFigma(
              context, getAccentColor(context), true, 'Done', Colors.white, () {
            setDialog(true);
            print('set');
            // Constant.goToNextPage(context, homeScreenRoute);
          },
              EdgeInsets.symmetric(
                  horizontal: Constant.getDefaultHorSpaceFigma(context)))
        ],
      ),
    );
  }
}
