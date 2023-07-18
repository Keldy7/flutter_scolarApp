import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scolar_pay/app/data/fake_data.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/constant.dart';

import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
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
    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    final List<ModelCategory> categoryList = FakeData.getAllCategoryList();

    return getScreenDetailDefaultView(context, detailsEnfantKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  10.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 151.h,
                    padding: EdgeInsets.all(10.h),
                    margin: EdgeInsets.symmetric(
                        horizontal: horSpace, vertical: 10.h),
                    decoration: getButtonDecoration(getCardColor(context),
                        withCorners: true,
                        corner: 20.h,
                        withBorder: true,
                        borderColor: getAccentColor(context),
                        shadow: [
                          const BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(-4, 5),
                              blurRadius: 16)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: 80.h,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              getCircularImage(context, double.infinity,
                                  double.infinity, 20.h, "happy.png",
                                  boxFit: BoxFit.cover),
                            ],
                          ),
                        ),
                        18.w.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont("Nom complet - Enfant ", 18,
                                getFontColor(context), 2,
                                fontWeight: FontWeight.w700),
                            const SizedBox(height: 1.0),
                            getCustomFont(
                                "Classe: CE1", 15, getFontGreyColor(context), 1,
                                fontWeight: FontWeight.w400),
                            getCustomFont("Ecole: Institut Frobel", 15,
                                getFontGreyColor(context), 3,
                                fontWeight: FontWeight.w400),
                            getCustomFont("Année scolaire: 2023-2024", 15,
                                getFontGreyColor(context), 1,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                  ),
                  20.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(right: 22.w, left: 22.w, bottom: 22.w),
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
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        mainAxisExtent: 65),
                                itemCount: categoryList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  ModelCategory category = categoryList[index];
                                  return CardCategory(
                                      title: category.title,
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
              Constant.goToNextPage(context, Routes.serviceListRoute);
            },
                EdgeInsets.only(
                    left: horSpace, right: horSpace, bottom: 30.h, top: 7.h))
          ],
        ),
        centerTitle: true);
  }
}
