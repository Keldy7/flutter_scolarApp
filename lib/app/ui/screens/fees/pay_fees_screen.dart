// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/image_keys.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/value_storage_controller.dart';
import '../../models/model_payment.dart';
import '../../styles/colors.dart';

class PaymentFeesScreen extends StatefulWidget {
  const PaymentFeesScreen({super.key});

  @override
  State<PaymentFeesScreen> createState() => _PaymentFeesScreenState();
}

class _PaymentFeesScreenState extends State<PaymentFeesScreen> {
  final List<ModelPayment> paymentList = FakeData.getAllPaymentList();
  List<bool> isChecked = [];
  List<int> stepListLength = [1, 2, 3];

  RxBool isCheckbox = false.obs;
  RxBool isCompleted = false.obs;

  int totalFees = 0;
  int currentStep = 1;

  @override
  void initState() {
    super.initState();
    isChecked.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double innerWidth = MediaQuery.sizeOf(context).width;
    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    var controller = Get.find<ValueStorageController>();
    // ModelPayment? paymentMethod = controller.selectedPaymentMethod;

    return getScreenDetailDefaultView(
      context,
      Labels.feeKey,
      () {
        Constant.backToPrev(context);
      },
      Theme(
        data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(onPrimary: primaryColor, primary: secondaryColor)),
        child: Stepper(
          type: StepperType.horizontal,
          steps: [
            _buildStepperOne(context, innerWidth),
            _buildStepperTwo(horSpace, innerWidth, controller),
            _buildStepperThree()
          ],
          currentStep: currentStep,
          // onStepTapped: (valueStep) {
          //   setState(() => currentStep = valueStep);
          // },
          onStepContinue: () {
            final isLastStep = currentStep == stepListLength.length - 1;
            if (!isLastStep) {
              setState(() => currentStep++);
            } else {
              setState(() => isCompleted = true.obs);
              showGetDialog(
                  context,
                  Images.confirmPaymentPng,
                  Labels.paiementEffectueKey,
                  Labels.descriptPaySuccessKey,
                  Labels.voirPaymentKey, () {
                Get.back();
                Constant.goToNextPage(context, Routes.feesScreenRoute);
              }, dialogHeight: 465, imgWidth: 96, imgHeight: 125);
            }
          },
          onStepCancel: currentStep == 1
              ? null
              : () {
                  setState(() => currentStep--);
                },
          controlsBuilder: (context, details) {
            final isLastStep = currentStep == stepListLength.length - 1;

            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentStep != 1)
                    Expanded(
                      flex: 1,
                      child: getButtonFigma(
                              context,
                              transparentColor,
                              true,
                              Labels.retourKey,
                              getAccentColor(context),
                              details.onStepCancel as Function,
                              isBorder: true,
                              borderColor: getAccentColor(context),
                              EdgeInsets.zero)
                          .paddingOnly(right: 10.w),
                    ),
                  Expanded(
                    flex: 1,
                    child: getButtonFigma(
                        context,
                        getAccentColor(context),
                        true,
                        isLastStep ? Labels.confirmerKey : Labels.continuerKey,
                        primaryColor,
                        details.onStepContinue as Function,
                        EdgeInsets.zero),
                  ),
                ],
              ).paddingSymmetric(vertical: 40.h),
            );
          },
        ),
      ),
    );
  }

  Step _buildStepperOne(BuildContext context, double innerWidth) {
    return Step(
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        label: getCustomFont(Labels.detailKey, 16, accentColor, 1,
            fontWeight: FontWeight.bold),
        title: Container(),
        content: Container());
  }

  Step _buildStepperTwo(
      double horSpace, double innerWidth, ValueStorageController controller) {
    return Step(
        isActive: currentStep >= 1,
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        label: currentStep > 1
            ? getCustomFont(Labels.paymentMethodsKey, 16, accentColor, 1,
                fontWeight: FontWeight.bold)
            : getCustomFont(Labels.paymentMethodsKey, 16, greyColor, 1),
        title: Container(),
        content: ListView.builder(
          shrinkWrap: true,
          itemCount: paymentList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            ModelPayment modelPayment = paymentList[index];
            return ObxValue(
                (p0) => Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: horSpace),
                          width: innerWidth,
                          height: 60.h,
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: getButtonDecoration(getCardColor(context),
                              withCorners: true,
                              corner: 12.h,
                              shadow: [
                                const BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.07999999821186066),
                                    offset: Offset(-4, 5),
                                    blurRadius: 16)
                              ]),
                          child: InkWell(
                            onTap: () {
                              print(index);
                              controller.selectedPaymentOption.value = index;
                            },
                            child: Row(
                              children: [
                                getAssetImage(
                                    context, modelPayment.image, 40.h, 40.h),
                                12.w.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getCustomFont(modelPayment.title, 16,
                                          getFontColor(context), 1,
                                          fontWeight: FontWeight.w700),
                                      getCustomFont("1% - les frais opérateurs",
                                          14, getFontColor(context), 1,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                                (p0 == index)
                                    ? getSvgImageWithSize(context,
                                        Images.radioCheckedSvg, 25.h, 25.h,
                                        fit: BoxFit.fill, color: secondaryColor)
                                    : getSvgImageWithSize(context,
                                        Images.radioUnselectedSvg, 25.h, 25.h,
                                        fit: BoxFit.fill, color: secondaryColor)
                              ],
                            ),
                          ),
                        ),
                        // (p0 == index) ? const Text("Consignes pour les transactions") : Container()
                      ],
                    ),
                controller.selectedPaymentOption);
          },
        ));
  }

  Step _buildStepperThree(
      // ModelPayment? payment,
      ) {
    TextEditingController numTelController = TextEditingController();
    numTelController.text = "";

    TextEditingController codeVerifController = TextEditingController();
    codeVerifController.text = "";

    return Step(
        title: Container(),
        label: getCustomFont(Labels.paiementKey, 16, greyColor, 1),
        content: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: getButtonDecoration(getCardColor(context),
                  withCorners: true,
                  corner: 12.h,
                  withBorder: false,
                  borderColor: getAccentColor(context),
                  shadow: [
                    const BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                        offset: Offset(-4, 5),
                        blurRadius: 16)
                  ]),
              width: double.infinity,
              height: 57.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSvgImageWithSize(context, Images.accountSvg, 34.h, 34.h,
                      fit: BoxFit.fill, color: secondaryColor),
                  12.w.horizontalSpace,
                  getCustomFont("texte {payment!.title}", 15, blackColor, 1)
                ],
              ),
            ),
            10.h.verticalSpace,
            getMultilineCustomFont(
                Labels.pleaseTapeSyntaxKey, 14.5, getFontColor(context),
                fontWeight: FontWeight.w400, textAlign: TextAlign.center),
            25.h.verticalSpace,
            getButtonFigma(context, primaryColor, true,
                    Labels.syntaxOrangeMoneyKey, secondaryColor, () async* {
              setState(() {
                _makingPhoneCall == true;
              });
            }, isBorder: true, borderColor: secondaryColor, EdgeInsets.zero)
                .paddingOnly(right: 65.w, left: 65.w),
            40.h.verticalSpace,
            getDefaultTextFiled(
              context,
              Labels.numTelephoneKey,
              numTelController,
              blackColor,
              (value) {},
            ),
            20.h.verticalSpace,
            getDefaultTextFiled(
              context,
              Labels.codeVerificationKey,
              codeVerifController,
              blackColor,
              (value) {},
            ),
          ],
        ),
        isActive: currentStep >= 2);
  }

  _makingPhoneCall() async {
    var url = Uri.parse("tel:9776765434");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
