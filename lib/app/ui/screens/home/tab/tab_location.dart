import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/image_keys.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/widget_utils.dart';
import '../../../styles/colors.dart';

class TabLocation extends StatelessWidget {
  const TabLocation({super.key});

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return Container(
      decoration: BoxDecoration(
          image:
              getDecorationAssetImage(context, Images.mapPng, fit: BoxFit.cover)),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: DraggableScrollableSheet(
          maxChildSize: 0.7,
          builder: (BuildContext context, myscrollController) {
            return Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
              ),
              child: ListView.builder(
                controller: myscrollController,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Constant.getDefaultHorSpaceFigma(context),
                        vertical: 10.h),
                    decoration: getButtonDecoration(getCardColor(context),
                        withCorners: true,
                        corner: 20.h,
                        shadow: [
                          const BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(-4, 5),
                              blurRadius: 16)
                        ]),
                    width: double.infinity,
                    height: 100.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: InkWell(
                      onTap: () {
                        Constant.goToNextPage(
                            context, Routes.salonDetailScreenRoute);
                      },
                      child: Row(
                        children: [
                          getCircularImage(context, 80.h, double.infinity, 20.h,
                              Images.banner3Png,
                              boxFit: BoxFit.cover),
                          12.w.horizontalSpace,
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont(
                                  "Nom école",
                                  18,
                                  getFontColor(context),
                                  1,
                                  fontWeight: FontWeight.w700,
                                ),
                                6.h.verticalSpace,
                                buildLocationRow(
                                    context,
                                    "2103 Cocody Route ZONE.  Abidjan 6134",
                                    getFontGreyColor(context)),
                                6.h.verticalSpace,
                                Row(
                                  children: [
                                    buildStarView(context, "4.9"),
                                    10.w.horizontalSpace,
                                    buildDistanceView(context, "50 m"),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
