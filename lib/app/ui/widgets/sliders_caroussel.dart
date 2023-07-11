import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../models/model_banner.dart';

import '../styles/colors.dart';
import '../../utils/constant.dart';
import '../../utils/widget_utils.dart';


class SlidersCaroussel extends StatelessWidget {
  const SlidersCaroussel({
    super.key,
    required this.sliderPos,
    required this.bannerList,
  });

  final RxInt sliderPos;
  final List<ModelBanner> bannerList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
                            dashedLine: const [2, 0],
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
            ),
          );
        }));
  }
}
