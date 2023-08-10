import 'package:flutter/material.dart';
import 'package:scolar_pay/app/utils/constant.dart';

import '../../../utils/widget_utils.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, "Emploi du temps", (){
        Constant.backToPrev(context);

    }, Column(
      children: [
        Text("Emploi du temps"),
      ],
    ));
  }
}