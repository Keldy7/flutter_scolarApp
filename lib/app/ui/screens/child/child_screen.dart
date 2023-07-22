import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/data/fake_data.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/constant.dart';

import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/bottom_selection_controller.dart';
import '../../controllers/home_controller.dart';
import '../../models/model_category.dart';
import '../../widgets/card_category.dart';

class ChildScreen extends StatefulWidget {
  const ChildScreen({super.key});

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double horSpace = Constant.getDefaultHorSpaceFigma(context) - 5;
    final List<ModelCategory> categoryList = FakeData.getAllCategoryList();

    return getScreenDetailDefaultView(context, Labels.detailsEnfantKey, () {
      var controller = Get.find<HomeController>();
      var bottomNavController = Get.find<BottomItemSelectionController>();
      bottomNavController.changePos(0);

      (!controller.fromDetail) ==
          Constant.goToNextPage(context, Routes.homeScreenRoute);
    },
        Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
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
                              decoration: getButtonDecoration(
                                  getCardColor(context),
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
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(30),
                              //   color: primaryColor,
                              // ),
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
                                  getCustomFont("Affoué Edwige Roxane", 18,
                                      getFontGreyColor(context), 1,
                                      fontWeight: FontWeight.w600),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          getCustomFont("Classe", 18,
                                              getFontGreyColor(context), 1,
                                              fontWeight: FontWeight.w500),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          const Text(
                                            'CE1',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
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
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          getCustomFont("Age", 18,
                                              getFontGreyColor(context), 1,
                                              fontWeight: FontWeight.w500),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          const Text(
                                            '9 ans',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
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
                                  const SizedBox(
                                    height: 5,
                                  ),
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
                                    'assets/images/png/girl.png',
                                    width: innerWidth * 0.45,
                                    height: innerHeight * 0.5,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              )),
                        ]);
                      })),

                  // Container(
                  //   width: double.infinity,
                  //   height: 151.h,
                  //   padding: EdgeInsets.all(10.h),
                  //   margin: EdgeInsets.symmetric(
                  //       horizontal: horSpace, vertical: 10.h),
                  //   decoration: getButtonDecoration(getCardColor(context),
                  //       withCorners: true,
                  //       corner: 20.h,
                  //       withBorder: true,
                  //       borderColor: secondaryColor,
                  //       shadow: [
                  //         const BoxShadow(
                  //             color:
                  //                 Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                  //             offset: Offset(-4, 5),
                  //             blurRadius: 16)
                  //       ]),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         width: 80.h,
                  //         height: double.infinity,
                  //         child: Stack(
                  //           children: [
                  //             getCircularImage(context, double.infinity,
                  //                 double.infinity, 20.h, Images.boyPng,
                  //                 boxFit: BoxFit.cover),
                  //           ],
                  //         ),
                  //       ),
                  //       18.w.horizontalSpace,
                  //       // Expanded(
                  //       //   child: Column(
                  //       //     crossAxisAlignment: CrossAxisAlignment.start,
                  //       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       //     children: [
                  //       //       getCustomFont("Nom complet - Enfant ", 18,
                  //       //           getFontColor(context), 2,
                  //       //           fontWeight: FontWeight.w700),
                  //       //       const SizedBox(height: 1.0),
                  //       //       getCustomFont(
                  //       //           "${Constant.addColonToLabel(Labels.ecoleKey)} Groupe Scolaire Les orchidées de Kouté",
                  //       //           15,
                  //       //           getFontGreyColor(context),
                  //       //           3,
                  //       //           fontWeight: FontWeight.w600),
                  //       //           getCustomFont(
                  //       //           "${Constant.addColonToLabel(Labels.classeKey)} CE2",
                  //       //           15,
                  //       //           getFontGreyColor(context),
                  //       //           1,
                  //       //           fontWeight: FontWeight.w600),
                  //       //       getCustomFont(
                  //       //           "${Constant.addColonToLabel(Labels.academicYearKey)} 2023-2024",
                  //       //           15,
                  //       //           getFontGreyColor(context),
                  //       //           1,
                  //       //           fontWeight: FontWeight.w600),
                  //       //     ],
                  //       //   ),
                  //       // ),

                  //     ],
                  //   ),
                  // ),

                  20.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 22.w),
                    child: LayoutBuilder(
                      builder: (BuildContext context,
                          BoxConstraints boxConstraints) {
                        return Wrap(
                            spacing: boxConstraints.maxWidth * (0.1),
                            runSpacing: 20,
                            direction: Axis.horizontal,
                            children: [
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                        mainAxisExtent: 65),
                                itemCount: categoryList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  ModelCategory category = categoryList[index];
                                  return CardCategory(
                                      title: category.title,
                                      nameSvg: category.image,
                                      onTapWigdet: () {
                                        Constant.goToNextPage(
                                            context, category.namePage);
                                      });
                                },
                              )
                            ]);
                      },
                    ),
                  )
                ],
              ),
            ),
            getButtonFigma(context, getAccentColor(context), true,
                "Modifier les informations", primaryColor, () {
              Constant.goToNextPage(context, Routes.editChildScreenRoute);
            }, EdgeInsets.only(bottom: 30.h, top: 7.h))
          ],
        ).paddingSymmetric(horizontal: 15),
        centerTitle: true);
  }
}
