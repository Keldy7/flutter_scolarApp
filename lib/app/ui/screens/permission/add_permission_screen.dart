import 'dart:math' as math;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scolar_pay/app/ui/widgets/addedFileContainer.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/constant.dart';
import '../../../utils/image_keys.dart';
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
  bool isOther = false;

  bool expand1 = false, expand2 = false;
  late AnimationController controller1, controller2;
  late Animation<double> animation1, animation1View;
  late Animation<double> animation2, animation2View;

  List<PlatformFile> uploadedFiles = [];

  void _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      uploadedFiles.addAll(result.files);
      setState(() {});
    }
  }

  //upload files
  void _addFiles() async {
    bool permissionGiven = (await Permission.storage.status).isGranted;
    if (permissionGiven) {
      _pickFiles();
    } else {
      permissionGiven = (await Permission.storage.request()).isGranted;
      if (permissionGiven) {
        _pickFiles();
      }
    }
  }

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
    final List<String> spinnerItems = [
      'Permission 1',
      'Permission 2',
      'Permission 3',
      'Permission 4',
      Labels.autreKey
    ];
    double horSpace = Constant.getDefaultHorSpaceFigma(context);

    TextEditingController titrePermissionController = TextEditingController();
    TextEditingController descriptPermissionController =
        TextEditingController();
    Rx firstDate = DateTime.now().obs;
    Rx lastDate = DateTime.now().obs;

    return getScreenDetailDefaultView(context, Labels.permissionsKey, () {
      Constant.backToPrev(context);
    },
        Column(children: [
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              children: [
                20.h.verticalSpace,
                buildTitle(context, Labels.titrePermissionKey),
                _buildListChoices(context, spinnerItems, controllerGet),
                Visibility(
                  visible: isOther,
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
                buildTitle(context, Labels.descriptionPermissionKey),
                20.h.verticalSpace,
                SizedBox(
                  height: 100,
                  child: getDefaultTextFiled(
                      context,
                      Labels.decrirePermissionKey,
                      descriptPermissionController,
                      getFontColor(context),
                      (value) {},
                      expandTextField: true),
                ),
                30.h.verticalSpace,
                buildTitle(context, Labels.periodePermissionKey),
                14.h.verticalSpace,
                buildTitles(context, Labels.startDatePermissionKey,
                    subTitle: Labels.endDatePermissionKey),
                10.h.verticalSpace,
                PeriodPermissions(firstDate: firstDate, lastDate: lastDate),
                30.h.verticalSpace,
                buildTitle(context, Labels.joindreFileKey),
                14.h.verticalSpace,
                AddedFileContainer(
                  onAdd: () {
                    _addFiles();
                  },
                ),
                10.h.verticalSpace,
                // Row(
                //   children: [
                //     Icon(
                //       Icons.attach_file,
                //       size: 18.h,
                //       color: secondaryColor,
                //     ),
                //     8.w.horizontalSpace,
                //     Expanded(
                //       flex: 1,
                //       child: getCustomFont(
                //           "nom_ficher.pdf;  22 Juin, 2023, 9:00",
                //           15,
                //           "#8A6E6E".toColor(),
                //           1,
                //           fontWeight: FontWeight.w400,
                //           fontFamily: Constant.fontsFamilyLato),
                //     ),
                //   ],
                // ).paddingOnly(right: 20.w, left: 20.w)
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: getButtonFigma(context, transparentColor, true,
                    Labels.annulerKey, getAccentColor(context), () {
                  Constant.backToPrev(context);
                },
                    isBorder: true,
                    borderColor: getAccentColor(context),
                    EdgeInsets.zero),
              ),
              20.w.horizontalSpace,
              Expanded(
                flex: 1,
                child: getButtonFigma(context, getAccentColor(context), true,
                    Labels.submitKey, primaryColor, () {
                  Get.bottomSheet(
                    Wrap(
                      children: [
                        getCustomFont(
                          Labels.demandeAbsenceScolaireKey,
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
                          valueClasse: "CM2",
                          onTap: () {
                            togglePanel1();
                          },
                          namePerson: "Konan Affoué Edwige Roxane ",
                          titleExpand: Labels.infosEnfantKey,
                        ),
                        _buildContentExpand(
                          context,
                          animationValue: animation2.value,
                          animationView: animation2View,
                          dateAction: "23 avr 2023",
                          valueClasse: "11h05",
                          onTap: () {
                            togglePanel2();
                          },
                          namePerson: "Aka Angele Grâce ",
                          titleExpand: Labels.infosPermissionKey,
                        ),
                        getButtonFigma(context, getAccentColor(context), true,
                            Labels.confirmPermissionKey, primaryColor, () {
                          showGetDialog(
                              context,
                              Images.donePng,
                              Labels.demandeEnvoyeeKey,
                              Labels.permissionSuccessKey,
                              Labels.afficherMesDemandesKey, () {
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
                }, EdgeInsets.zero),
              ),
            ],
          ).paddingSymmetric(horizontal: horSpace, vertical: 40.h),
          // getButtonFigma(context, getAccentColor(context), true,
          //     "Soumettre la permission d'absence", primaryColor, () {
          //    // dialogHeight: 465, imgWidth: 96, imgHeight: 129);
          // }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 40.h))
          // EdgeInsets.only(
          // left: horSpace, right: horSpace, bottom: 30.h, top: 7.h))
        ]),
        subtitleText: Labels.demanderPermissionKey,
        subtitle: true,
        centerTitle: true);
  }

  ObxValue<RxInt> _buildListChoices(BuildContext context,
      List<String> spinnerItems, FiltersController controllerGet) {
    return ObxValue(
        (p0) => Container(
              width: double.infinity,
              height: getEditHeightFigma(),
              decoration: getButtonDecoration(transparentColor,
                  withCorners: true,
                  corner: getButtonCornersFigma(),
                  withBorder: true,
                  borderColor: getFontHint(context)),
              child: Center(
                child: DropdownButton<String>(
                  value: spinnerItems[controllerGet.selectedSortPos.value],
                  icon: getSvgImageWithSize(
                      context, Images.arrowDownSvg, 18.h, 18.h,
                      color: secondaryColor),
                  iconSize: 24,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  isDense: true,
                  isExpanded: true,
                  style: buildTextStyle(
                      context, getFontColor(context), FontWeight.w500, 16),
                  underline: 0.verticalSpace,
                  onChanged: (String? data) {
                    setState(() {
                      controllerGet.selectedSortPos.value =
                          spinnerItems.indexOf(data ?? "");
                      if (spinnerItems[controllerGet.selectedSortPos.value] ==
                          Labels.autreKey) {
                        isOther = true;
                      } else {
                        isOther = false;
                      }
                    });
                  },
                  items: spinnerItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: getCustomFont(value, 15, blackColor, 1),
                    );
                  }).toList(),
                ).marginSymmetric(horizontal: 12.w),
              ),
            ).paddingAll(19.h),
        controllerGet.selectedSortPos);
  }

  Widget _buildContentExpand(
    BuildContext context, {
    required String titleExpand,
    required String namePerson,
    required String valueClasse,
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
            getCustomFont(titleExpand, 17, black40Color, 1,
                fontWeight: FontWeight.w600),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(namePerson, 16, blackColor, 1),
              Container(height: 5),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: getCustomFont(
                          Constant.addColonToLabel(Labels.classeKey),
                          15,
                          black40Color,
                          1,
                          fontWeight: FontWeight.w600)),
                  Flexible(
                      child: getCustomFont(
                          valueClasse, 14, getAccentColor(context), 1,
                          fontWeight: FontWeight.w600))
                ],
              ),
              Container(height: 5),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: getCustomFont(
                          Constant.addColonToLabel(Labels.ecoleKey),
                          15,
                          black40Color,
                          1,
                          fontWeight: FontWeight.w600)),
                  Flexible(child: getCustomFont(dateAction, 14, blackColor, 1))
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

class PeriodPermissions extends StatelessWidget {
  const PeriodPermissions({
    super.key,
    required this.firstDate,
    required this.lastDate,
  });

  final Rx firstDate;
  final Rx lastDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ObxValue(
              (p0) => buildDatePickerButton(
                      context,
                      DateFormat('dd-MM-yyyy', 'fr_FR').format(firstDate.value),
                      Images.calendarSvg, () async {
                    DateTime? startDate = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(
                                      onPrimary: primaryColor,
                                      primary: getAccentColor(context))),
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
                      debugPrint('fstartDate---$startDate');
                    }
                  }),
              firstDate),
        ),
        Expanded(
          child: ObxValue(
              (p0) => buildDatePickerButton(
                      context,
                      DateFormat('dd-MM-yyyy', 'fr_FR').format(lastDate.value),
                      Images.calendarSvg, () async {
                    DateTime? endDate = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(
                                      onPrimary: primaryColor,
                                      primary: getAccentColor(context))),
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
                      debugPrint('fendDate---$endDate');
                    }
                  }),
              lastDate),
        ),
      ],
    );
  }
}
