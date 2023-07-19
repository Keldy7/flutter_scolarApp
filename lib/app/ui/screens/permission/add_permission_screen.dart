import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/filters_controller.dart';
import '../../styles/colors.dart';

class AddPermissionScreen extends StatefulWidget {
  const AddPermissionScreen({super.key});

  @override
  State<AddPermissionScreen> createState() => _AddPermissionScreenState();
}

class _AddPermissionScreenState extends State<AddPermissionScreen>
    with TickerProviderStateMixin {
  bool isAutre = false;

  bool expand1 = false, expand2 = false;
  late AnimationController controller1, controller2;
  late Animation<double> animation1, animation1View;
  late Animation<double> animation2, animation2View;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation1 = Tween(begin: 0.0, end: 180.0).animate(controller1);
    animation1View = CurvedAnimation(parent: controller1, curve: Curves.linear);
    
    animation2 = Tween(begin: 0.0, end: 180.0).animate(controller2);
    animation2View = CurvedAnimation(parent: controller2, curve: Curves.linear);

    controller1.addListener(() {
      setState(() {});
    });

    controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    var controllerGet = Get.find<FiltersController>();
    final List<String> spinnerItems = ['Perm 1', 'Perm 2', 'Perm 3', 'Four', autreKey];
    double horSpace = Constant.getDefaultHorSpaceFigma(context);

    // TextEditingController nameController = TextEditingController();
    TextEditingController titrePermissionController = TextEditingController();
    TextEditingController descriptPermissionController =
        TextEditingController();
    Rx firstDate = DateTime.now().obs;
    Rx lastDate = DateTime.now().obs;

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
                                    context, "arrow_down.svg", 18.h, 18.h,
                                    color: accentColor),
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
                                    if (spinnerItems[controllerGet
                                            .selectedSortPos.value] ==
                                        autreKey) {
                                      isAutre = true;
                                    } else {
                                      isAutre = false;
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
                  visible: isAutre,
                  child: Column(
                    children: [
                      getDefaultTextFiled(
                              context,
                              "Autre: Visite chez le dentiste",
                              titrePermissionController,
                              getFontColor(context),
                              (value) {})
                          .marginOnly(top: 2.h),
                    ],
                  ),
                ),
                16.h.verticalSpace,
                buildTitle(context, "Description de la permission"),
                20.h.verticalSpace,
                SizedBox(
                  height: 100,
                  child: getDefaultTextFiled(
                      context,
                      "Decrivez la raison...",
                      descriptPermissionController,
                      getFontColor(context),
                      (value) {},
                      expandTextField: true),
                ),
                30.h.verticalSpace,
                buildTitle(context, "Période de la permission"),
                14.h.verticalSpace,
                buildTitles(context, "Date de début", subTitle: "Date de fin"),
                10.h.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: ObxValue(
                          (p0) => buildDatePickerButton(
                                  context,
                                  DateFormat('dd-MM-yyyy', 'fr_FR')
                                      .format(firstDate.value),
                                  "calendar.svg", () async {
                                DateTime? startDate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: Theme.of(context)
                                              .colorScheme
                                              .copyWith(
                                                  onPrimary: accentColor,
                                                  primaryContainer: accentColor,
                                                  primary: Colors.white,
                                                  secondary: Colors.black,
                                                  onSecondary: accentColor)),
                                      child: child!,
                                    );
                                  },
                                  locale: const Locale("fr", "FR"),
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(DateTime.now().year),
                                  lastDate: DateTime(2150),
                                );

                                if (startDate != null) {
                                  firstDate.value = startDate;
                                  debugPrint('fdate---$startDate');
                                }
                              }),
                          firstDate),
                    ),
                    Expanded(
                      child: ObxValue(
                          (p0) => buildDatePickerButton(
                                  context,
                                  DateFormat('dd-MM-yyyy', 'fr_FR')
                                      .format(lastDate.value),
                                  "calendar.svg", () async {
                                DateTime? endDate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: Theme.of(context)
                                              .colorScheme
                                              .copyWith(
                                                  onPrimary: accentColor,
                                                  primaryContainer: accentColor,
                                                  primary: Colors.white,
                                                  secondary: Colors.black,
                                                  onSecondary: accentColor)),
                                      child: child!,
                                    );
                                  },
                                  locale: const Locale("fr", "FR"),
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(DateTime.now().year),
                                  lastDate: DateTime(2150),
                                );

                                if (endDate != null) {
                                  lastDate.value = endDate;
                                  debugPrint('fdate---$endDate');
                                }
                              }),
                          lastDate),
                    ),
                  ],
                ),
                30.h.verticalSpace,
                buildTitle(context, "Joindre des fichiers ?"),
                18.h.verticalSpace,
                getDefaultTextFiled(
                    context,
                    "Sélectionnez le fichier...",
                    descriptPermissionController,
                    getFontColor(context),
                    (value) {},
                    withSuffix: true,
                    imgNameSuffix: "attach.svg"),
                Row(
                  children: [
                    Icon(
                      Icons.attach_file,
                      size: 18.h,
                      color: getAccentColor(context),
                    ),
                    8.w.horizontalSpace,
                    Expanded(
                      flex: 1,
                      child: getCustomFont(
                          "nom_ficher.pdf;  22 Juin, 2023, 9:00",
                          15,
                          "#8A6E6E".toColor(),
                          1,
                          fontWeight: FontWeight.w400,
                          fontFamily: Constant.fontsFamilyLato),
                    ),
                  ],
                ).paddingOnly(right: 20.w, left: 20.w)
              ],
            ),
          ),
          getButtonFigma(context, getAccentColor(context), true,
              "Soumettre la permission d'absence", primaryColor, () {
            Get.bottomSheet(
              Wrap(
                children: [
                  getCustomFont(
                    "Demande d'absence scolaire",
                    18,
                    getFontColor(context),
                    1,
                    fontWeight: FontWeight.w700,
                  ).paddingSymmetric(horizontal: horSpace),
                  _buildContentExpand(
                    context,
                    animationValue: animation1.value,
                    animationView: animation1View,
                    dateAction: "EPV Les fleuriets d'Angré",
                    nameCenter: "CM2",
                    onTap: () {
                      togglePanel1();
                    },
                    nameSurname: "Konan Affoué Edwige Roxane ",
                    titleExpand: "Informations sur l'enfant",
                  ),
                  _buildContentExpand(
                    context,
                    animationValue: animation2.value,
                    animationView: animation2View,
                    dateAction: "23 avr 2023",
                    nameCenter: "11h05",

                    onTap: () {
                      togglePanel2();
                    },
                    nameSurname: "Aka Angele Grâce ",
                    titleExpand: "Informations sur la permission",
                  ),
                  getButtonFigma(context, getAccentColor(context), true,
                      "Confirmer la soumission", Colors.white, () {
                    showGetDialog(
                        context,
                        "done.png",
                        "Demande envoyée!",
                        "La permission d'absence scolaire de votre enfant a été envoyé avec succès!",
                        "Afficher mes demandes", () {
                      Get.back();
                      Constant.goToNextPage(
                          context, Routes.permissionsScreenRoute);
                    });
                  },
                      EdgeInsets.only(
                          left: horSpace, right: horSpace, top: 30.h))
                ],
              ).paddingSymmetric(vertical: 40.h),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.h))),
              backgroundColor: getCardColor(context),
              isScrollControlled: true,
            );

            // dialogHeight: 465, imgWidth: 96, imgHeight: 129);
          }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 40.h))
          // EdgeInsets.only(
          // left: horSpace, right: horSpace, bottom: 30.h, top: 7.h))
        ]),
        subtitleText: demanderPermissionKey,
        subtitle: true,
        centerTitle: true);
  }

  Widget _buildContentExpand(
    BuildContext context, {
    required String titleExpand,
    required String nameSurname,
    required String nameCenter,
    required String dateAction,
    required double animationValue,
    required Animation<double> animationView,
    required Function onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(titleExpand,
                style: TextStyle(
                    color: black40Color, fontWeight: FontWeight.w600)),
            const Spacer(),
            Transform.rotate(
              angle: animationValue * math.pi / 180,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: black40Color,
                ),
                onPressed: () {
                  onTap.call();
                },
              ),
            ),
          ],
        ),
        SizeTransition(
          sizeFactor: animationView,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nameSurname,
                  style: TextStyle(
                      fontWeight: FontWeight.w600)),
              Container(height: 5),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Text("Classe : ",
                          style: TextStyle(
                              color: black40Color,
                              fontWeight: FontWeight.w600))),
                  Flexible(child: Text(nameCenter,
                          style: TextStyle(
                              color: accentColor,
                              fontWeight: FontWeight.w600)))
                ],
              ),
              Container(height: 5),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Text("École : ",
                          style: TextStyle(
                              color: black40Color,
                              fontWeight: FontWeight.w600))),
                  Flexible(child: Text(dateAction))
                ],
              ),
            ],
          ),
        ),
      ],
    ).paddingOnly(right: 20.w, left: 20.w);
  }

  void togglePanel1() {
    if (!expand1) {
      controller1.forward();
    } else {
      controller1.reverse();
    }
    expand1 = !expand1;
  }

  void togglePanel2() {
    if (!expand2) {
      controller2.forward();
    } else {
      controller2.reverse();
    }
    expand2 = !expand2;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();

    super.dispose();
  }
}
