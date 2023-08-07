import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/widget_utils.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, "Enseignants", (){
      Constant.backToPrev(context);
    }, Column(children: [
                       
    ],));
  }
}