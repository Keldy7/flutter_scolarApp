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
                        setRow(
                            titleLabel: Labels.totalKey,
                            amountLabel: totalFees.toString(),
                            isCheckboxRequired: false,
                            index: 0),
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

  Widget listOfFees({required List<Fees> feesDetails}) {
    return Column(
        children: List.generate(
            feesDetails.length,
            (index) => setRow(
                titleLabel: feesDetails[index].name!,
                amountLabel: feesDetails[index].amount.toString(),
                isCheckboxRequired: true,
                index: index)));
  }

  Widget setRow(
      {required String titleLabel,
      required String amountLabel,
      required bool isCheckboxRequired,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isCheckboxRequired)
            SizedBox(
              height: 15,
              width: 15,
              child: ObxValue((p0) {
                return Checkbox(
                  visualDensity: VisualDensity.compact,
                  side: BorderSide(color: secondaryColor, width: 1.h),
                  activeColor: secondaryColor,
                  onChanged: (value) {
                    isCheckbox.value = value!;
                  },
                  value: isCheckbox.value,
                );
              }, isCheckbox),
            )
          else
            const SizedBox.shrink(),
          Expanded(
              child: Padding(
            padding: (isCheckboxRequired)
                ? const EdgeInsetsDirectional.only(start: 15)
                : const EdgeInsetsDirectional.only(start: 30),
            child: Text(titleLabel),
          )),
          Text(amountLabel),
        ],
      ),
    );
  }

  _onChanged(bool val, int index, String amountLabel) {
    setState(() {
      isChecked[index] = val;

      (val)
          ? totalFees += double.parse(amountLabel)
          : totalFees -= double.parse(amountLabel);
    });
  }
}
