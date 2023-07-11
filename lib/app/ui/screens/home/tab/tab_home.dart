import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scolar_pay/app/data/fake_data.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/widget_utils.dart';
import '../../../models/model_banner.dart';
import '../../../widgets/bordered_profile_picture.dart';

class TabHome extends StatefulWidget {
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
        Align(
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
                          child: CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                height: double.infinity,
                                viewportFraction: 0.9,
                                enlargeCenterPage: true,
                                onPageChanged: (position, reason) {
                                  sliderPos.value = position;
                                },
                                enableInfiniteScroll: true,
                              ),
                              items: List.generate(bannerList.length, (index) {
                                ModelBanner banner = bannerList[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 17.w, top: 21.w),
                                    height: double.infinity,
                                    decoration: getButtonDecoration(
                                        banner.color.toColor(),
                                        withCorners: true,
                                        corner: 20.w),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 97.w,
                                                height: 39.w,
                                                child: GFBorder(
                                                  dashedLine: [2, 0],
                                                  type: GFBorderType.oval,
                                                  color:
                                                      getAccentColor(context),
                                                  padding: EdgeInsets.zero,
                                                  child: Center(
                                                    child: getCustomFont(
                                                        "10% Off",
                                                        22,
                                                        getAccentColor(context),
                                                        1,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textAlign:
                                                            TextAlign.center,
                                                        horFactor: true,
                                                        fontFamily: Constant
                                                            .fontsFamilyOffer),
                                                  ),
                                                ),
                                              ),
                                              9.w.verticalSpace,
                                              getCustomFont("On manicure", 18,
                                                  getFontColor(context), 1,
                                                  fontWeight: FontWeight.w700,
                                                  txtHeight: 1.5),
                                              4.w.verticalSpace,
                                              getCustomFont(
                                                  "By Royalty barbershop",
                                                  14,
                                                  getFontGreyColor(context),
                                                  1,
                                                  fontWeight: FontWeight.w400,
                                                  txtHeight: 1.5),
                                              Expanded(
                                                flex: 1,
                                                child: 0.verticalSpace,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  getCustomFont(
                                                      "See details",
                                                      18,
                                                      getFontColor(context),
                                                      1,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      txtHeight: 1.5),
                                                  8.w.horizontalSpace,
                                                  Icon(
                                                    Icons.arrow_forward_rounded,
                                                    color:
                                                        getFontColor(context),
                                                    size: 18.w,
                                                  )
                                                ],
                                              ),
                                              28.w.verticalSpace
                                            ],
                                          ),
                                        ),
                                        getAssetImage(context, banner.img,
                                            174.w, double.infinity,
                                            boxFit: BoxFit.fill)
                                      ],
                                    ),
                                    // color: greenColor,
                                  ),
                                );
                              })),
                        ),
                        20.h.verticalSpace,
                        ObxValue(
                            (p0) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: indicators(context, bannerList.length,
                                    sliderPos.value)),
                            sliderPos),
                        20.h.verticalSpace,
                        const Center(
                          child: Text("Tab Home"),
                        ),
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
                                _buildChildDetailsContainer(
                                    width: boxConstraints.maxWidth * (0.45)),
                                _buildChildDetailsContainer(
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
        ),
        Align(
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
                      AssetImage('assets/images/happy.png'),
                      size: 28,
                      color: Colors.white,
                    ),
                    Text("Scolar Pay",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
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
        )
      ],
    );
  }

  Widget _buildChildDetailsContainer({required double width}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: getAccentColor(context),
            borderRadius: BorderRadius.circular(20)),
        width: width,
        height: 130,
        child: LayoutBuilder(builder: (context, boxConstraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.12),
                      ),
                      BorderedProfilePicture(
                          onTap: () {},
                          heightAndWidthPercentage: 0.35,
                          boxConstraints: boxConstraints,
                          imageUrl: "image"),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.075),
                      ),
                      Text(
                        "Nom Prénoms",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.025),
                      ),
                      Text("Class",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

List<Widget> indicators(BuildContext context, imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
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
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    width: 50,
    height: double.infinity,
    color: greenColor,
  );
}
