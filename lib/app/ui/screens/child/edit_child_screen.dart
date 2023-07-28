import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/constant.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

import '../../../utils/label_keys.dart';

class EditChildScreen extends StatefulWidget {
  const EditChildScreen({super.key});

  @override
  State<EditChildScreen> createState() => _EditChildScreenState();
}

class _EditChildScreenState extends State<EditChildScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    TextEditingController nomController =
        TextEditingController(text: "Kouassy");
    TextEditingController prenomController =
        TextEditingController(text: "Audy");
    TextEditingController classeController = TextEditingController(text: "CE2");
    // TextEditingController matriculeController =
    //     TextEditingController(text: "EL34461");
    TextEditingController academicYearController =
        TextEditingController(text: "2023-2024");
    TextEditingController ecoleController =
        TextEditingController(text: "Groupe Scolaire Les orchidées de Kouté");
    TextEditingController paysController =
        TextEditingController(text: "Côte d'Ivoire");
    TextEditingController villeController =
        TextEditingController(text: "Kouté");
    TextEditingController adrGeoController =
        TextEditingController(text: "Abiékan non loin du forum des jeunes");

    return getScreenDetailDefaultView(
      context,
      Labels.profilEnfantKey,
      () {
        Constant.backToPrev(context);
      },
      Column(children: [
        Expanded(
            child: ListView(
          shrinkWrap: true,
          children: [
            20.h.verticalSpace,
            getBorderedContainer(
                context,
                width,
                Column(
                  children: [
                    buildTitle(context, Labels.infosEnfantKey),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.nomKey),
                        nomController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.prenomsKey),
                        prenomController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.dateNaissanceKey),
                        prenomController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                  ],
                )),
            40.h.verticalSpace,
            getBorderedContainer(
                context,
                width,
                Column(
                  children: [
                    buildTitle(context, Labels.infosNivoScolaireKey),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.academicYearKey),
                        academicYearController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.classeKey),
                        classeController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                    // getDefaultUnderlineTextFiled(
                    //     context,
                    //     Constant.addColonToLabel(Labels.matriculeKey),
                    //     matriculeController,
                    //     getFontHint(context),
                    //     (value) {},
                    //     readOnly: true),
                    20.h.verticalSpace,
                  ],
                )),
            40.h.verticalSpace,
            getBorderedContainer(
                context,
                width,
                Column(
                  children: [
                    buildTitle(context, Labels.infosEcoleKey),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.ecoleKey),
                        ecoleController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.paysKey),
                        paysController,
                        getFontHint(context),
                        (value) {},
                        readOnly: true),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.villeKey),
                        villeController,
                        getFontHint(context),
                        (value) {},
                        readOnly: true),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.adrGeoKey),
                        adrGeoController,
                        getFontHint(context),
                        (value) {},
                        readOnly: true),
                  ],
                )),
          ],
        ))
      ]).paddingSymmetric(horizontal: 15),
    );
  }
}
