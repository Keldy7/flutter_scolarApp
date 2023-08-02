import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';
import '../../models/model_fees.dart';
import '../../styles/colors.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  List<bool> isChecked = [false, false, false];
  double totalFees = 0;

  // List<Fees> feesDetail = [

  // ];
  RxBool isCheckbox = false.obs;

  double amount = 0;
  int paymentTransactionId = 0;

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
    double width = MediaQuery.sizeOf(context).width;

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
                const Text("Scolarité"),
                getBorderedContainer(
                    context,
                    width,
                    Column(
                      children: [
                        listOfFees(feesDetails: FakeData.getAllFeesList()),
                        getDivider(),
                      ],
                    ).paddingSymmetric(
                      horizontal: MediaQuery.of(context).size.width * (0.05),
                    ))
              ],
            ))
          ],
        ).paddingSymmetric(horizontal: 15),
        centerTitle: true);
  }

// Fonction pour gérer le changement de la case à cocher
  void _onChanged(int index, bool value, List<Fees> feesDetails) {
    Fees fee = feesDetails[index];
    (value) ? totalFees += fee.amount : totalFees -= fee.amount;
    print(totalFees);
    // Mettez à jour l'état des cases à cocher pour la ligne actuelle
    fee.isChecked = value;
    // Rafraîchir l'affichage pour refléter les changements
    setState(() {});
  }

  // Widget listOfFees({required List<Fees> feesDetails}) {
  //   return Column(
  //       children: List.generate(
  //           feesDetails.length,
  //           (index) => setRow(
  //               titleLabel: feesDetails[index].name!,
  //               amountLabel: feesDetails[index].amount.toString(),
  //               isCheckboxRequired: true,
  //               index: index)));
  // }

  Widget listOfFees({required List<Fees> feesDetails}) {
    return Column(
      children: List.generate(
        feesDetails.length,
        (index) => setRow(
          titleLabel: feesDetails[index].name!,
          amountLabel: feesDetails[index].amount.toString(),
          index: index,
          isCheckboxRequired: true,
          onChanged: (index, value) {
            setState(() {
              _onChanged(index, value, feesDetails);
            });
          },
        ),
      ),
    );
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
                side: BorderSide(color: getAccentColor(context), width: 1.h),
                activeColor: secondaryColor,
                onChanged: (value) {
                  onChanged(index, value ?? false);
                },
                value: isCheckboxRequired,
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
