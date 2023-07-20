import 'package:flutter/material.dart';
import 'package:scolar_pay/app/utils/constant.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/widget_utils.dart';

class ExamenScreen extends StatefulWidget {
  const ExamenScreen({super.key});

  @override
  State<ExamenScreen> createState() => _ExamenScreenState();
}

class _ExamenScreenState extends State<ExamenScreen> {
  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, Labels.examensCompositionsKey,
        () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                Text("No hay exámenes disponibles"),
              ],
            ))
          ],
        ));
  }
}
