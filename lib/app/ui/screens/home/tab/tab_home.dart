
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/data/fake_data.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/ui/widgets/custom_child_identity_bloc.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/widget_utils.dart';
import '../../../models/model_banner.dart';
import '../../../widgets/sliders_caroussel.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  final List<ModelBanner> bannerList = FakeData.getAllBannerList();

  @override
  Widget build(BuildContext context) {
    RxInt sliderPos = 0.obs;

    return Stack(
      children: [
        _buildBodyContent(context, sliderPos),
        _buildAppBar()
      ],
    );
  }

  Align _buildAppBar() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 120.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ImageIcon(
                    AssetImage(Constant.getImagePngPath('happy.png')),
                    size: 28,
                    color: primaryColor,
                  ),
                  Text(nomAppKey,
                      style: TextStyle(
                          fontSize: 22,
                          color: primaryColor,
                          fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: primaryColor,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  // SvgPicture.asset(
                  //   'assets/images/arrow.svg',
                  //   height: 32,
                  //   width: 32,
                  // ),
                ]),
          ),
        ),
      );
  }

  Align _buildBodyContent(BuildContext context, RxInt sliderPos) {
    return Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            getToolbarTopViewHeight(context).verticalSpace,
            55.h.verticalSpace,
            Expanded(
              flex: 1,
              child: getDefaultContainerView(
                  context,
                  ListView(
                    padding: EdgeInsets.only(top: 30.h),
                    children: [
                      SizedBox(
                        height: 185.w,
                        child: SlidersCaroussel(sliderPos: sliderPos, bannerList: bannerList),
                      ),
                      20.h.verticalSpace,
                      ObxValue(
                          (p0) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: indicators(context, bannerList.length,
                                  sliderPos.value)),
                          sliderPos),
                      20.h.verticalSpace,
                      buildSeeAllView(context, mesEnfantsKey, () {
                        Constant.goToNextPage(
                            context, Routes.categoryScreenRoute);
                      }),
                      20.w.verticalSpace,
                      LayoutBuilder(builder: (context, boxConstraints) {
                        return Wrap(
                            spacing: boxConstraints.maxWidth * (0.1),
                            runSpacing: 32.5,
                            children: [
                              CustomChildIdentityBloc(
                                  width: boxConstraints.maxWidth * (0.45)),
                              CustomChildIdentityBloc(
                                  width: boxConstraints.maxWidth * (0.45)),
                            ]);
                      }).paddingSymmetric(
                          horizontal:
                              Constant.getDefaultHorSpaceFigma(context))
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: 104.h)),
            ),
          ],
        ),
      );
  }

}


List<Widget> indicators(BuildContext context, imagesLength, currentIndex) {
  return List.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 8.w,
      height: 8.w,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? getAccentColor(context)
              : lightAccentColor,
          shape: BoxShape.circle),
    );
  });
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    width: 50,
    height: double.infinity,
    color: primaryColor,
  );
}