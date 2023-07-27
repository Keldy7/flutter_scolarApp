import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/storage.dart';
import '../../models/model_intro.dart';
import '../../styles/colors.dart';
import '../../widgets/dots_indicator.dart';


// ignore: must_be_immutable
class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  backClick(BuildContext context) {
    Constant.backToFinish(context);
  }

  final List<ModelIntro> introList = FakeData.getAllIntroList();
  RxInt selectedPos = 0.obs;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);

    Constant.setupSize(context);
    EdgeInsets edgeInsets = EdgeInsets.symmetric(
        horizontal: Constant.getDefaultHorSpaceFigma(context));

    return WillPopScope(
        child: Scaffold(
          appBar: getInVisibleAppBar(),
          backgroundColor: getCurrentTheme(context).scaffoldBackgroundColor,
          body: Container(
            padding: edgeInsets,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      selectedPos.value = value;
                    },
                    controller: pageController,
                    itemBuilder: (context, index) {
                      ModelIntro modelIntro = introList[index];
                      return Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: getAssetImage(context, modelIntro.image,
                                double.infinity, 384.h,
                                boxFit: BoxFit.scaleDown),
                          ),
                          42.h.verticalSpace,
                          getMultilineCustomFont(
                              modelIntro.title, 22, getFontColor(context),
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700),
                          30.h.verticalSpace,
                          getMultilineCustomFont(
                              modelIntro.description, 16, getFontColor(context),
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500),
                          80.h.verticalSpace
                        ],
                      );
                    },
                    itemCount: introList.length,
                  ),
                ),
                ObxValue((p0) {
                  return DotsIndicator(
                    size: 10,
                    controller: pageController,
                    color: indicatorColor,
                    selectedPos: selectedPos.value,
                    selectedColor: getAccentColor(context),
                    onPageSelected: (value) {},
                    itemCount: introList.length,
                  );
                }, selectedPos),
                30.h.verticalSpace,
                ObxValue(
                    (p0) => getButtonFigma(
                          context,
                          getAccentColor(context),
                          true,
                          (selectedPos.value == introList.length - 1)
                              ? Labels.getStartedKey
                              : Labels.suivantKey,
                          primaryColor,
                          () {
                            if (selectedPos.value == introList.length - 1) {
                              changeIntroVal(false);
                              Constant.goToNextPage(context, Routes.registrationRoute);
                            } else {
                              pageController.jumpToPage(selectedPos.value + 1);
                              // if (selectedPos.value < introList.length - 1) {
                              //   pageController
                              //       .jumpToPage(selectedPos.value + 1);
                              // } else {
                              //   changeIntroVal(false);
                              //   Constant.sendToNext(context, loginRoute);
                              // }
                            }
                          },
                          EdgeInsets.zero,
                        ),
                    selectedPos),
                28.h.verticalSpace,
                ObxValue(
                    (p0) => InkWell(
                          onTap: () {
                            changeIntroVal(false);
                            Constant.goToNextPage(context, Routes.loginRoute);
                          },
                          child: getCustomFont(
                            (selectedPos.value == introList.length - 1)
                                ? Labels.connexionKey
                                : Labels.continuerKey,
                            16,
                            getFontColor(context),
                            1,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          ),
                        ),
                    selectedPos),
                40.h.verticalSpace
              ],
            ),
          ),
        ),
        onWillPop: () async {
          backClick(context);
          return false;
        });
  }
}
