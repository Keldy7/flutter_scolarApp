import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scolar_pay/app/utils/routes.dart';

import '../../utils/constant.dart';
import '../../utils/image_keys.dart';
import '../../utils/widget_utils.dart';
import '../styles/colors.dart';
import 'bordered_profile_picture.dart';

class CustomChildIdentityBloc extends StatelessWidget {
  final width;
  const CustomChildIdentityBloc({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Constant.goToNextPage(context, Routes.childScreenRoute);
      },
      child: Container(
        decoration: getButtonDecoration(getCardColor(context),
            withCorners: true,
            corner: 20.w,
            shadow: [
              const BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                  offset: Offset(-4, 5),
                  blurRadius: 16)
            ]),
        // decoration: BoxDecoration(
        //     color: primaryColor,
        //     borderRadius: BorderRadius.circular(20)),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.12),
                      ),
                      BorderedProfilePicture(
                          onTap: () {
                            Constant.goToNextPage(
                                context, Routes.childScreenRoute);
                          },
                          heightAndWidthPercentage: 0.35,
                          boxConstraints: boxConstraints,
                          imageUrl: "image"),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.075),
                      ),
                      getCustomFont("Nom Prénoms", 15, blackColor, 1,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.025),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getSvgImageWithSize(context, Images.classSvg, 15, 15,
                              fit: BoxFit.fill, color: getAccentColor(context)),
                          10.w.horizontalSpace,
                          getCustomFont("CM2", 13, blackColor, 1,
                              fontWeight: FontWeight.w500),
                        ],
                      )
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
