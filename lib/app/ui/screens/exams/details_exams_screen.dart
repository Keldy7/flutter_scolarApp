import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';
import '../../styles/colors.dart';

class DetailExamsScreen extends StatefulWidget {
  const DetailExamsScreen({super.key});

  @override
  State<DetailExamsScreen> createState() => _DetailExamsScreenState();
}

class _DetailExamsScreenState extends State<DetailExamsScreen> {
  int note = 68;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return getScreenDetailDefaultView(context, Labels.resultatsKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                20.h.verticalSpace,
                Container(
                    width: width,
                    decoration: getButtonDecoration(getCardColor(context),
                        withCorners: true,
                        corner: 20.h,
                        withBorder: true,
                        borderColor: accentColor,
                        shadow: [
                          const BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(-4, 5),
                              blurRadius: 16)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTitles(context, Labels.matieresKey,
                            subTitle: Labels.noteKey,
                            sizeTitle: 18,
                            withPadding: false),
                        Column(
                            children: List.generate(5, (index) {
                          return ListTile(
                            title: buildTitles(context, "Nom matière",
                                subTitle: "$note",
                                sizeTitle: 16,
                                withPadding: false),
                            subtitle: Container(
                              height: 10,
                              child: LinearProgressIndicator(
                                value: note / 100,
                                valueColor:
                                    AlwaysStoppedAnimation<Color?>(secondaryColor),
                                backgroundColor: greyColor.withOpacity(.5),
                              ),
                            ),
                          );
                        })),
                      ],
                    ).paddingAll(15)),
                40.h.verticalSpace,
                Container(
                    // height: height * 0.2,
                    width: width,
                    decoration: getButtonDecoration(getCardColor(context),
                        withCorners: true,
                        corner: 20.h,
                        withBorder: true,
                        borderColor: accentColor,
                        shadow: [
                          const BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(-4, 5),
                              blurRadius: 16)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTitle(context, Labels.mentionAppreciationKey,
                            withPadding: false),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  15.h.verticalSpace,
                                  getCustomFont(
                                      "${Constant.addColonToLabel(Labels.mentionKey)} Assez-bien",
                                      16,
                                      redColor,
                                      2,
                                      fontWeight: FontWeight.w600),
                                  getMultilineCustomFont(
                                    "Mes encouragements sincères. Elève studieux et attentif mais peut mieux faire encore.",
                                    15,
                                    black40Color,
                                    isItalic: true
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: width * .8,
                                    height: height * .2,
                                    child: CircleAvatar(
                                      backgroundColor: secondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ).paddingAll(15))
              ],
            ))
          ],
        ).paddingSymmetric(horizontal: 15));
  }
}
