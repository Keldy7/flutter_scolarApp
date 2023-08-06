import 'package:flutter/material.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(context, "Enseignants", (){}, Column(children: [
      Center(
        child: Text("Enseignants"),
      )
    ],));
  }
}