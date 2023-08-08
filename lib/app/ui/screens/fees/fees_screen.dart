import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../models/model_fees.dart';
import '../../models/model_payment.dart';
import '../../styles/colors.dart';
// import 'fee_data.dart';
// import 'fee_widget.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  final List<ModelPayment> paymentList = FakeData.getAllPaymentList();
  List<bool> isChecked = [];
  List<int> stepListLength = [1, 2, 3];

  RxBool isCheckbox = false.obs;
  RxBool isCompleted = false.obs;

  int totalFees = 0;

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

    return getScreenDetailDefaultView(context, Labels.feeKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  20.h.verticalSpace,
                  getBorderedContainer(
                          context,
                          innerWidth,
                          _buildExpansionTile(
                              context, innerWidth, "Mai", "10", false),
                          widthBorder: 1)
                      .paddingSymmetric(vertical: 15.h),
                  Column(
                      children: List.generate(
                    3,
                    (index) => getBorderedContainer(
                            context,
                            innerWidth,
                            _buildExpansionTile(
                                context, innerWidth, "Avril", "10", true),
                            widthBorder: 1)
                        .paddingSymmetric(vertical: 15.h),
                  )),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 15)

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
                  "${Labels.paiementKey} $nameMonth ", 16, blackColor, 1,
                  fontWeight: FontWeight.w700),
              getCustomFont("$numDay $nameMonth 2024", 16, blackColor, 1,
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
                //List of fees
                listOfFees(feesDetails: FakeData.getAllFeesList()),
                getDivider(),
                // Title for total fees
                setRow(
                    titleLabel: Labels.totalKey,
                    amountLabel: totalFees.toString(),
                    isCheckboxRequired: false,
                    index: 0,
                    onChanged: (index, value) {}),
                //Button for pay now
                isPaid
                    ? Container()
                    : getButtonFigma(context, getAccentColor(context), true,
                        Labels.payNowKey, primaryColor, () {
                        Constant.goToNextPage(
                            context, Routes.paymentFeesScreenRoute);
                      }, EdgeInsets.zero),
              ],
            ).paddingSymmetric(
              horizontal: MediaQuery.of(context).size.width * (0.05),
            )
          ],
        ),
      ],
    );
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
                    });
                  },
                )));
  }

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
                side: BorderSide(color: secondaryColor, width: 1.h),
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
