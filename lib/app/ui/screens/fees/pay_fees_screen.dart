// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/image_keys.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/value_storage_controller.dart';
import '../../models/model_fees.dart';
import '../../models/model_payment.dart';
import '../../styles/colors.dart';
// import 'fee_data.dart';
// import 'fee_widget.dart';

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
  int currentStep = 0;

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

    return getScreenDetailDefaultView(
      context,
      Labels.feeKey,
      () {
        Constant.backToPrev(context);
      },

      Stepper(
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
            debugPrint("fin step");
          }
        },
        onStepCancel: currentStep == 0
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
                if (currentStep != 0)
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

      // Container(
      //     decoration: BoxDecoration(
      //       borderRadius: const BorderRadius.only(
      //         topLeft: Radius.circular(20),
      //         topRight: Radius.circular(20),
      //       ),
      //       color: Color(0xFFF4F6F7),
      //     ),
      //     child: ListView.builder(
      //         shrinkWrap: true,
      //         physics: const BouncingScrollPhysics(),
      //         padding: const EdgeInsets.all(5),
      //         itemCount: fee.length,
      //         itemBuilder: (context, int index) {
      //           return Container(
      //             margin: const EdgeInsets.only(bottom: 20),
      //             child: Column(
      //               children: [
      //                 Container(
      //                   padding: const EdgeInsets.all(20),
      //                   decoration: BoxDecoration(
      //                     borderRadius: const BorderRadius.vertical(
      //                       top: Radius.circular(20),
      //                     ),
      //                     color: cardColor,
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: blackColor,
      //                         blurRadius: 2.0,
      //                       ),
      //                     ],
      //                   ),
      //                   child: Column(
      //                     children: [
      //                       FeeDetailRow(
      //                         title: 'Receipt No',
      //                         statusValue: fee[index].receiptNo,
      //                       ),
      //                       const SizedBox(
      //                         height: 20,
      //                         child: Divider(
      //                           thickness: 1.0,
      //                         ),
      //                       ),
      //                       FeeDetailRow(
      //                         title: 'Month',
      //                         statusValue: fee[index].month,
      //                       ),
      //                       FeeDetailRow(
      //                         title: 'Payment Date',
      //                         statusValue: fee[index].date,
      //                       ),
      //                       FeeDetailRow(
      //                         title: 'Status',
      //                         statusValue: fee[index].paymentStatus,
      //                       ),
      //                       const SizedBox(
      //                         height: 20,
      //                         child: Divider(
      //                           thickness: 1.0,
      //                         ),
      //                       ),
      //                       FeeDetailRow(
      //                         title: 'Total Amount',
      //                         statusValue: fee[index].totalAmount,
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 FeeButton(
      //                     title: fee[index].btnStatus,
      //                     iconData: fee[index].btnStatus == 'Paid'
      //                         ? Icons.download_outlined
      //                         : Icons.arrow_forward_outlined,
      //                     onPress: () {})
      //               ],
      //             ),
      //           );
      //         }))
    );
  }

  Step _buildStepperOne(BuildContext context, double innerWidth) {
    return Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: getCustomFont(Labels.detailKey, 16, blackColor, 1),
        content: Column(
          children: [
            getBorderedContainer(
                    context,
                    innerWidth,
                    _buildExpansionTile(
                        context, innerWidth, "Mai", "10", false),
                    isBlockFees: true)
                .paddingSymmetric(vertical: 15.h),
            Column(
                children: List.generate(
              3,
              (index) => getBorderedContainer(
                context,
                innerWidth,
                _buildExpansionTile(context, innerWidth, "Avril", "10", true),
              ).paddingSymmetric(vertical: 15.h),
            )),
          ],
        ));
  }

  _buildExpansionTile(BuildContext context, double innerWidth, String nameMonth,
      String numDay, bool isPaid) {
    return Column(
      children: [
        ExpansionTile(
          textColor: blackColor,
          collapsedTextColor: blackColor,
          iconColor: blackColor,
          collapsedIconColor: blackColor,
          childrenPadding: const EdgeInsets.all(0),
          shape: Border.all(color: Colors.transparent),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(
                  "${Labels.paiementKey} $nameMonth", 16, blackColor, 1,
                  fontWeight: FontWeight.w700),
              getCustomFont("$numDay $nameMonth", 16, blackColor, 1,
                  fontWeight: FontWeight.w700)
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: innerWidth * (0.25),
                  height: 25,
                  decoration: getButtonDecoration(
                    isPaid ? greenColor : redColor,
                    withCorners: true,
                    corner: 15.w,
                    shadow: [
                      const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                          offset: Offset(-4, 5),
                          blurRadius: 16)
                    ],
                  ),
                  child: getCustomFont(
                      isPaid ? Labels.payeeKey : Labels.enAttenteKey,
                      15,
                      primaryColor,
                      1)),
              getCustomFont(Constant.getCurrency(context, totalFees.toString()),
                  16, blackColor, 1,
                  fontWeight: FontWeight.w700),
            ],
          ).paddingSymmetric(vertical: 8.h),
          children: [
            Column(
              children: [
                listOfFees(feesDetails: FakeData.getAllFeesList()),
                getDivider(),
                setRow(
                    titleLabel: Labels.totalKey,
                    amountLabel: totalFees.toString(),
                    isCheckboxRequired: false,
                    index: 0,
                    onChanged: (index, value) {}),
              ],
            ).paddingSymmetric(
              horizontal: MediaQuery.of(context).size.width * (0.05),
            )
          ],
        ),
      ],
    );
  }

  Step _buildStepperTwo(
      double horSpace, double innerWidth, ValueStorageController controller) {
    return Step(
        isActive: currentStep >= 1,
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        title: getCustomFont(Labels.paymentMethodsKey, 16, blackColor, 1),
        content: ListView(
          shrinkWrap: true,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: paymentList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                ModelPayment modelPayment = paymentList[index];
                return ObxValue(
                    (p0) => Container(
                          padding: EdgeInsets.symmetric(horizontal: horSpace),
                          width: innerWidth,
                          height: 60.h,
                          margin: EdgeInsets.symmetric(
                              horizontal: horSpace, vertical: 10.h),
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
                              controller.selectedPaymentOption.value = index;
                            },
                            child: Row(
                              children: [
                                getAssetImage(
                                    context, modelPayment.image, 40.h, 40.h),
                                12.w.horizontalSpace,
                                Expanded(
                                  flex: 1,
                                  child: getCustomFont(modelPayment.title, 16,
                                      getFontColor(context), 1,
                                      fontWeight: FontWeight.w700),
                                ),
                                (p0 == index)
                                    ? getSvgImageWithSize(context,
                                        Images.radioCheckedSvg, 25.h, 25.h,
                                        fit: BoxFit.fill)
                                    : getSvgImageWithSize(context,
                                        Images.radioUnselectedSvg, 25.h, 25.h,
                                        fit: BoxFit.fill)
                              ],
                            ),
                          ),
                        ),
                    controller.selectedPaymentOption);
              },
            ),
          ],
        ));
  }

  Step _buildStepperThree() {
    return Step(
        title: getCustomFont("Paiement", 16, blackColor, 1),
        content: Center(
          child: getCustomFont("Paiement", 14, blackColor, 1),
        ),
        isActive: currentStep >= 2);
  }

// Fonction pour gérer le changement de la case à cocher
  void _onChanged(int index, bool value, List<Fees> feesDetails) {
    Fees fee = feesDetails[index];
    (value) ? totalFees += fee.amount : totalFees -= fee.amount;
    // Mettez à jour l'état des cases à cocher pour la ligne actuelle
    fee.isChecked = value;
    // Rafraîchir l'affichage pour refléter les changements
    setState(() {});
  }

  Widget listOfFees({required List<Fees> feesDetails}) {
    return Column(
        children: List.generate(
            feesDetails.length,
            (index) => setRow(
                  titleLabel: feesDetails[index].name,
                  amountLabel: feesDetails[index].amount.toString(),
                  isCheckboxRequired: true,
                  index: index,
                  onChanged: (index, value) {
                    setState(() {
                      _onChanged(index, value, feesDetails);
                      print(value);
                    });
                  },
                )));
  }

  // Widget listOfFees({required List<Fees> feesDetails}) {
  //   return Column(
  //     children: List.generate(
  //       feesDetails.length,
  //       (index) => setRow(
  //         titleLabel: feesDetails[index].name!,
  //         amountLabel: feesDetails[index].amount.toString(),
  //         index: index,
  //         isCheckboxRequired: true,
  //         onChanged: (index, value) {
  //           setState(() {
  //             _onChanged(index, value, feesDetails);
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }

  Widget setRow({
    required String titleLabel,
    required String amountLabel,
    required bool isCheckboxRequired,
    required int index,
    required Function(int index, bool value) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isCheckboxRequired)
            SizedBox(
              height: 15,
              width: 15,
              child: Checkbox(
                visualDensity: VisualDensity.compact,
                side: BorderSide(color: getAccentColor(context), width: 1.h),
                activeColor: secondaryColor,
                onChanged: (value) {
                  onChanged(index, value ?? false);
                },
                value: false,
              ),
            )
          else
            const SizedBox.shrink(),
          Expanded(
            child: Padding(
              padding: (isCheckboxRequired)
                  ? const EdgeInsetsDirectional.only(start: 15)
                  : const EdgeInsetsDirectional.only(start: 30),
              child: Text(titleLabel),
            ),
          ),
          Text(amountLabel),
        ],
      ),
    );
  }

  // Widget setRow(
  //     {required String titleLabel,
  //     required String amountLabel,
  //     required bool isCheckboxRequired,
  //     required int index}) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         if (isCheckboxRequired)
  //           SizedBox(
  //             height: 15,
  //             width: 15,
  //             child: ObxValue((p0) {
  //               return Checkbox(
  //                 visualDensity: VisualDensity.compact,
  //                 side: BorderSide(color: getAccentColor(context), width: 1.h),
  //                 activeColor: secondaryColor,
  //                 onChanged: (value) {
  //                   _onChanged(value!, index, amountLabel);
  //                   // isCheckbox.value = value!;
  //                   print(index);
  //                 },
  //                 value: isCheckbox.value,
  //               );
  //             }, isCheckbox),
  //           )
  //         else
  //           const SizedBox.shrink(),
  //         Expanded(
  //             child: Padding(
  //           padding: (isCheckboxRequired)
  //               ? const EdgeInsetsDirectional.only(start: 15)
  //               : const EdgeInsetsDirectional.only(start: 30),
  //           child: Text(titleLabel),
  //         )),
  //         Text(amountLabel),
  //       ],
  //     ),
  //   );
  // }

  // _onChanged(bool val, int index, String amountLabel) {
  //   setState(() {
  //     isChecked[index] = val;

  //     (val)
  //         ? totalFees += double.parse(amountLabel)
  //         : totalFees -= double.parse(amountLabel);
  //   });
  // }
}
