import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/constant.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

import '../../../utils/label_keys.dart';

class EditChildScreen extends StatefulWidget {
  const EditChildScreen({super.key});

  @override
  State<EditChildScreen> createState() => _EditChildScreenState();
}

class _EditChildScreenState extends State<EditChildScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return getScreenDetailDefaultView(
      context,
      Labels.profilEnfantKey,
      () {
        Constant.backToPrev(context);
      },
      Column(children: [
        Expanded(
            child: ListView(
          shrinkWrap: true,
          children: [
            Container(
                height: height * 0.43,
                child: LayoutBuilder(builder: (context, constraints) {
                  double innerHeight = constraints.maxHeight;
                  double innerWidth = constraints.maxWidth;
                  return Stack(fit: StackFit.expand, children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: innerHeight * 0.6,
                        width: innerWidth,
                        decoration: getButtonDecoration(getCardColor(context),
                            withCorners: true,
                            corner: 20.h,
                            withBorder: true,
                            borderColor: secondaryColor,
                            shadow: [
                              const BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.07999999821186066),
                                  offset: Offset(-4, 5),
                                  blurRadius: 16)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'KONAN',
                              style: TextStyle(
                                  color: blackColor,
                                  fontFamily: 'Nunito',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Affoué Edwige Roxane',
                              style: TextStyle(
                                color: black40Color,
                                fontFamily: 'Nunito',
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Classe',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Text(
                                      'CE1',
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 8,
                                  ),
                                  child: Container(
                                    height: 50,
                                    width: 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Age',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Text(
                                      '9 ans',
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            getCustomFont(
                                    "${Constant.addColonToLabel(Labels.ecoleKey)} Groupe Scolaire Les orchidées de Kouté",
                                    15,
                                    getFontGreyColor(context),
                                    3,
                                    fontWeight: FontWeight.w600)
                                .paddingSymmetric(horizontal: 15),
                            getCustomFont(
                                "${Constant.addColonToLabel(Labels.academicYearKey)} 2023-2024",
                                15,
                                getFontGreyColor(context),
                                1,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            child: Image.asset(
                              'assets/images/png/boy.png',
                              width: innerWidth * 0.45,
                              height: innerHeight * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )),
                  ]);
                })),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: height * 0.5,
                width: width,
                decoration: getButtonDecoration(getCardColor(context),
                    withCorners: true,
                    corner: 20.h,
                    withBorder: true,
                    borderColor: secondaryColor,
                    shadow: [
                      const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                          offset: Offset(-4, 5),
                          blurRadius: 16)
                    ]),
                child: const Text('test').paddingAll(5))
          ],
        ))
      ]).paddingSymmetric(horizontal: 15),
    );
  }
}
