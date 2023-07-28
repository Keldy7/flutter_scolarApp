import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/constant.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

import '../../../utils/label_keys.dart';
// import '../../../utils/routes.dart';

class EditChildScreen extends StatefulWidget {
  const EditChildScreen({super.key});

  @override
  State<EditChildScreen> createState() => _EditChildScreenState();
}

class _EditChildScreenState extends State<EditChildScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double horSpace = Constant.getDefaultHorSpaceFigma(context);

    //Enfant
    TextEditingController nomEnfantController =
        TextEditingController(text: "Kouassy");
    TextEditingController prenomEnfantController =
        TextEditingController(text: "Audy");
    TextEditingController classeController = TextEditingController(text: "CE2");
    // TextEditingController matriculeController =
    //     TextEditingController(text: "EL34461");

    //Ecole
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
    TextEditingController phoneEcoleController =
        TextEditingController(text: "+225 01 01 090 090");

    //Père
    TextEditingController nomPereController =
        TextEditingController(text: "Kouassy");
    TextEditingController prenomPereController =
        TextEditingController(text: "Roland Serge");
    TextEditingController phonePereController =
        TextEditingController(text: "+225 07 77 591 905");    
    //Mère
    TextEditingController nomMereController =
        TextEditingController(text: "Ehivet");
    TextEditingController prenomMereController =
        TextEditingController(text: "Akoua Jeannette");
TextEditingController phoneMereController =
        TextEditingController(text: "+225 01 41 541 253");

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
                        nomEnfantController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.prenomsKey),
                        prenomEnfantController,
                        getFontHint(context),
                        (value) {}),
                    20.h.verticalSpace,
                    getDefaultUnderlineTextFiled(
                        context,
                        Constant.addColonToLabel(Labels.dateNaissanceKey),
                        prenomEnfantController,
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
                  20.h.verticalSpace,
                  getDefaultUnderlineTextFiled(
                      context,
                      Constant.addColonToLabel(Labels.phoneKey),
                      phoneEcoleController,
                      getFontHint(context),
                      (value) {},
                      readOnly: true),
                ],
              ),
            ),
            40.h.verticalSpace,
            getBorderedContainer(
              context,
              width,
              Column(
                children: [
                  buildTitle(context, Labels.infosParentsKey),
                  20.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: getDivider(
                            setColor: getCurrentTheme(context).hintColor),
                      ),
                      buildTitle(context, Labels.pereKey),
                      Expanded(
                        flex: 1,
                        child: getDivider(
                            setColor: getCurrentTheme(context).hintColor),
                      )
                    ],
                  ).marginSymmetric(horizontal: horSpace),
                  30.h.verticalSpace,
                  getDefaultUnderlineTextFiled(
                      context,
                      Constant.addColonToLabel(Labels.nomKey),
                      nomPereController,
                      getFontHint(context),
                      (value) {},
                      readOnly: true),
                  20.h.verticalSpace,
                  getDefaultUnderlineTextFiled(
                      context,
                      Constant.addColonToLabel(Labels.prenomsKey),
                      prenomPereController,
                      getFontHint(context),
                      (value) {},
                      readOnly: true),
                  20.h.verticalSpace,
                  getDefaultUnderlineTextFiled(
                      context,
                      Constant.addColonToLabel(Labels.phoneKey),
                      phonePereController,
                      getFontHint(context),
                      (value) {},
                      readOnly: true),
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: getDivider(
                            setColor: getCurrentTheme(context).hintColor),
                      ),
                      buildTitle(context, Labels.mereKey),
                      Expanded(
                        flex: 1,
                        child: getDivider(
                            setColor: getCurrentTheme(context).hintColor),
                      )
                    ],
                  ).marginSymmetric(horizontal: horSpace),
                  30.h.verticalSpace,
                  getDefaultUnderlineTextFiled(
                      context,
                      Constant.addColonToLabel(Labels.nomKey),
                      nomMereController,
                      getFontHint(context),
                      (value) {},
                      readOnly: true),
                  20.h.verticalSpace,
                  getDefaultUnderlineTextFiled(
                      context,
                      Constant.addColonToLabel(Labels.prenomsKey),
                      prenomMereController,
                      getFontHint(context),
                      (value) {},
                      readOnly: true),
                  20.h.verticalSpace,
                  getDefaultUnderlineTextFiled(
                      context,
                      Constant.addColonToLabel(Labels.phoneKey),
                      phoneMereController,
                      getFontHint(context),
                      (value) {},
                      readOnly: true),
                ],
              ),
            ),
          ],
        )),
        getButtonFigma(
            context,
            getAccentColor(context),
            true,
            Labels.saveModificationKey,
            primaryColor,
            () {},
            EdgeInsets.only(bottom: 30.h, top: 7.h))
      ]).paddingSymmetric(horizontal: 15),
    );
  }
}
