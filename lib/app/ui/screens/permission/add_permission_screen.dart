import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/constant.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/filters_controller.dart';
import '../../styles/colors.dart';

class AddPermissionScreen extends StatefulWidget {
  const AddPermissionScreen({super.key});

  @override
  State<AddPermissionScreen> createState() => _AddPermissionScreenState();
}

class _AddPermissionScreenState extends State<AddPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLast = false;
    var controllerGet = Get.find<FiltersController>();
    final List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', autreKey];

    TextEditingController nameController = TextEditingController();
    Rx date = DateTime.now().obs;

    return getScreenDetailDefaultView(context, permissionsKey, () {
      Constant.backToPrev(context);
    },
        Column(children: [
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              children: [
                20.h.verticalSpace,
                buildTitle(context, "Titre de la permission"),
                ObxValue(
                    (p0) => Padding(
                          padding: EdgeInsets.all(19.h),
                          child: Container(
                            width: double.infinity,
                            // height: 56.h,
                            height: getEditHeightFigma(),
                            decoration: getButtonDecoration(Colors.transparent,
                                withCorners: true,
                                corner: getButtonCornersFigma(),
                                withBorder: true,
                                borderColor: getFontHint(context)),
                            child: Center(
                              child: DropdownButton<String>(
                                value: spinnerItems[
                                    controllerGet.selectedSortPos.value],
                                icon: getSvgImageWithSize(
                                    context, "arrow_down.svg", 18.h, 18.h),
                                iconSize: 24,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                isDense: true,
                                isExpanded: true,
                                style: buildTextStyle(context,
                                    getFontColor(context), FontWeight.w500, 16),
                                underline: 0.verticalSpace,
                                onChanged: (String? data) {
                                  setState(() {
                                    controllerGet.selectedSortPos.value =
                                      spinnerItems.indexOf(data ?? "");
                                    if (spinnerItems[spinnerItems.length - 1] ==
                                        autreKey) {
                                      isLast = false;
                                    } else {
                                      isLast = true;
                                    }
                                  });
                                },
                                items: spinnerItems
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ).marginSymmetric(horizontal: 12.w),
                            ),
                          ),
                        ),
                    controllerGet.selectedSortPos),
                Visibility(
                  visible: isLast,
                  child: Column(
                    children: [
                      getDefaultTextFiled(
                              context,
                              "Autre: Visite chez le dentiste",
                              nameController,
                              getFontColor(context),
                              (value) {})
                          .marginOnly(top: 2.h),
                    ],
                  ),
                ),
                20.h.verticalSpace,
                buildTitle(context, "Description de la permission"),
                16.h.verticalSpace,
                getDefaultTextFiled(
                          context,
                          "Descrivez la raison...",
                          nameController,
                          getFontColor(context),
                          (value) {}),
                buildTitle(context, "Date de la permission"),
                16.h.verticalSpace,
                ObxValue(
                    (p0) => buildDatePickerButton(
                            context,
                            DateFormat('dd-MM-yyyy').format(date.value),
                            "calendar.svg", () async {
                          DateTime? pickedDate = await showDatePicker(
                            // locale: const Locale("fr", "FR"),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2150),
                          );

                          if (pickedDate != null) {
                            date.value = pickedDate;
                            debugPrint('fdate---${date.value}---$pickedDate');
                          }
                        }),
                    date),
              ],
            ),
          ),
        ]),
        subtitleText: demanderPermissionKey,
        subtitle: true,
        centerTitle: true);
  }
}
