import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scolar_pay/app/data/fake_data.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/constant.dart';

import '../../../../utils/routes.dart';
import '../../../../utils/widget_utils.dart';
import '../../../models/model_category.dart';

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

    return getScreenDetailDefaultView(context, "Détails: Mon enfant", () {
      Constant.backToPrev(context);
    },
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 151.h,
                padding: EdgeInsets.all(10.h),
                margin:
                    EdgeInsets.symmetric(horizontal: horSpace, vertical: 10.h),
                decoration: getButtonDecoration(getCardColor(context),
                    withCorners: true,
                    corner: 20.h,
                    withBorder: true,
                    borderColor: getAccentColor(context),
                    shadow: [
                      const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
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
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont("Nom complet - Enfant ", 18,
                              getFontColor(context), 2,
                              fontWeight: FontWeight.w700),
                          const SizedBox(height: 1.0),
                          getCustomFont(
                              "Classe: CE2", 15, getFontGreyColor(context), 1,
                              fontWeight: FontWeight.w400),
                          getCustomFont("Ecole: Institut Frobel", 15,
                              getFontGreyColor(context), 3,
                              fontWeight: FontWeight.w400),
                          getCustomFont("Année scolaire: 2023-2024", 15,
                              getFontGreyColor(context), 1,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.w.verticalSpace,
              SizedBox(
                height: 100.w,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    ModelCategory category = categoryList[index];
                    return Container(
                      margin: EdgeInsets.only(
                          left: horSpace,
                          right: horSpace),
                      width: double.infinity,
                      height: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Constant.goToNextPage(context, Routes.salonScreenRoute);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: getCircularImage(context, double.infinity,
                                  double.infinity, 12.w, category.image,
                                  boxFit: BoxFit.cover),
                            ),
                            6.w.verticalSpace,
                            getCustomFont(
                                category.title, 14, getFontColor(context), 1,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                txtHeight: 1.5),
                            2.w.verticalSpace,
                          ],
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        )));
  }
}
