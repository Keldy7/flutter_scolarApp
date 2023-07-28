import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/data/fake_data.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/ui/widgets/custom_child_identity_bloc.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/image_keys.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/widget_utils.dart';
import '../../../controllers/value_selection_controller.dart';
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
      children: [_buildBodyContent(context, sliderPos), _buildAppBar()],
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
                  AssetImage(Constant.getImagePngPath(Images.boyPng)),
                  size: 28,
                  color: primaryColor,
                ),
                Text(Labels.nomAppKey,
                    style: TextStyle(
                        fontSize: 22,
                        color: primaryColor,
                        fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
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
    var selectionController = Get.find<ValueSelectionController>();
    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    final List<String> nearestSalonList = [
      Images.intro3Png,
      Images.intro4Png,
      Images.intro1Png
    ];

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
                      child: SlidersCaroussel(
                          sliderPos: sliderPos, bannerList: bannerList),
                    ),
                    20.h.verticalSpace,
                    ObxValue(
                        (p0) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: indicators(
                                context, bannerList.length, sliderPos.value)),
                        sliderPos),
                    20.h.verticalSpace,
                    buildSeeAllView(context, "Near by beauty salon", () {
                      selectionController
                          .setSelectedTitle("Near by beauty salon");
                      // Constant.goToNextPage(context, Routes.);
                    }),
                    SizedBox(
                      height: 292.w,
                      child: ListView.builder(
                        itemCount: nearestSalonList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10.w),
                            margin: EdgeInsets.only(
                                left: (index == 0) ? horSpace : 6.w,
                                right: (index == nearestSalonList.length - 1)
                                    ? horSpace
                                    : 6.w,
                                top: 20.w,
                                bottom: 20.w),
                            width: 278.w,
                            decoration: getButtonDecoration(
                                getCardColor(context),
                                withCorners: true,
                                corner: 20.w,
                                shadow: [
                                  const BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.07999999821186066),
                                      offset: Offset(-4, 5),
                                      blurRadius: 16)
                                ]),
                            height: double.infinity,
                            child: InkWell(
                              onTap: () {
                                Constant.goToNextPage(
                                    context, Routes.attendanceScreenRoute);
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        getCircularImage(
                                            context,
                                            double.infinity,
                                            double.infinity,
                                            20.w,
                                            nearestSalonList[index],
                                            boxFit: BoxFit.cover),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: buildFavouriteBtn(
                                              EdgeInsets.all(10.w)),
                                        )
                                      ],
                                    ),
                                  ),
                                  10.w.verticalSpace,
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: getCustomFont(
                                            "Royalty  barbershop",
                                            16,
                                            getFontColor(context),
                                            1,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      getSvgImageWithSize(
                                          context, Images.starSvg, 17.w, 17.w,
                                          fit: BoxFit.fill),
                                      6.w.horizontalSpace,
                                      getCustomFont(
                                          "4.9", 14, getAccentColor(context), 1,
                                          fontWeight: FontWeight.w400,
                                          txtHeight: 1.5),
                                    ],
                                  ),
                                  10.w.verticalSpace,
                                  buildLocationRow(
                                      context,
                                      "8502 Preston Rd. Inglewood, Maine",
                                      getFontGreyColor(context)),
                                  // 10.w.verticalSpace,
                                  // Row(
                                  //   children: [
                                  //     getSvgImageWithSize(context,
                                  //         Images.distanceSvg, 17.w, 17.w,
                                  //         fit: BoxFit.fill,
                                  //         color: getAccentColor(context)),
                                  //     6.w.horizontalSpace,
                                  //     Expanded(
                                  //       flex: 1,
                                  //       child: getCustomFont("20 m", 14,
                                  //           getAccentColor(context), 1,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //     buildButtonBookNow(context, () {})
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                      ),
                    ),
                    20.h.verticalSpace,
                    buildSeeAllView(context, Labels.mesEnfantsKey, () {
                      selectionController
                          .setSelectedTitle(Labels.mesEnfantsKey);
                      Constant.goToNextPage(
                          context, Routes.childrenScreenRoute);
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
                            CustomChildIdentityBloc(
                                width: boxConstraints.maxWidth * (0.45)),
                          ]);
                    }).paddingSymmetric(
                        horizontal: Constant.getDefaultHorSpaceFigma(context)),
                    10.w.verticalSpace,
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
          color: currentIndex == index ? secondaryColor : lightOrangeColor,
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
