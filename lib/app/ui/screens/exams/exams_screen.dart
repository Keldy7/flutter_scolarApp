import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/image_keys.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../styles/colors.dart';

class ExamenScreen extends StatefulWidget {
  const ExamenScreen({super.key});

  @override
  State<ExamenScreen> createState() => _ExamenScreenState();
}

class _ExamenScreenState extends State<ExamenScreen> {
  final List<String> tabList = [Labels.examensKey, Labels.compositionsKey];

  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, Labels.examensCompositionsKey,
        () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                20.h.verticalSpace,
                buildTitles(context, "Jan - Fev"),
                Container(
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: Colors.amber.shade200, width: 8)),
                            color: Theme.of(context).cardColor,
              //               // borderRadius: BorderRadius.circular(15),
              //           
                  ),
                  padding: EdgeInsets.fromLTRB(20, 15,15,15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('day'),
                      Row(children: [
                        Text("erty"),
                       Text(" . "),
                      Text('code'),
                      Text(" . "),
                      Text('venue')
                      ]),
                      Text('time'),

                    ],
                  ),
                ),
              //   .width(double.infinity)
                
              //           .decorated(
              //             border: Border(left: BorderSide(color: Colors.amber.shade200, width: 8)),
              //               color: Theme.of(context).cardColor,
              //               // borderRadius: BorderRadius.circular(15),
              //           ).clipRRect(all: 15).decorated(
                
              //               boxShadow: [
              //             BoxShadow(
              //                 blurRadius: 20,
              //                 color: Colors.black.withOpacity(.1),
              //                 offset: Offset(0, 8))
              //           ])


              //  .padding(horizontal: 15, bottom: 15);
                Column(
                  children: List.generate(7, (int _) {
                    return Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: greyColor),
                            borderRadius: BorderRadius.circular(8)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        color: primaryColor,
                        shadowColor: shadowColor,
                        margin: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            Constant.goToNextPage(
                                context, Routes.examsDetailScreenRoute);
                          },
                          child: SizedBox(
                              height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 10,
                                    color: secondaryColor,
                                  ),
                                  10.w.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        getCustomFont(
                                            "Titre compo", 16, blackColor, 2,
                                            fontWeight: FontWeight.bold),
                                        const Spacer(),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              size: 18.h,
                                              color: accentColor,
                                            ),
                                            8.w.horizontalSpace,
                                            getCustomFont(
                                                "Vendredi, 22 Juillet 2023",
                                                14,
                                                greyFontColor,
                                                1),
                                          ],
                                        ),
                                        5.h.verticalSpace,
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.access_time_outlined,
                                              size: 18.h,
                                              color: accentColor,
                                            ),
                                            8.w.horizontalSpace,
                                            getCustomFont("09H - 11H", 14,
                                                greyFontColor, 1),
                                          ],
                                        ),
                                      ],
                                    ).paddingOnly(top: 15, bottom: 15),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      getCustomFont(
                                          "Assez-bien", 14, fontPrimary, 1)
                                    ],
                                  ).paddingOnly(right: 10)
                                ],
                              )),
                        )).paddingOnly(bottom: 10);
                  }),
                )
              ],
            ))
          ],
        ).paddingSymmetric(horizontal: 15),
        actionImg: Images.filterIconSvg,
        withLeading: true,
        centerTitle: true,
        subtitle: true,
        subtitleText: 'Aperçu des épreuves écrites');
  }
}
