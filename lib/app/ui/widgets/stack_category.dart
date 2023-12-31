import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

class WikiCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const WikiCategory(
      {super.key,
      required this.icon,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(26.0),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Opacity(
              opacity: 0.3,
              child: Icon(
                icon,
                size: 40,
                color: primaryColor,
              )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: primaryColor,
            ),
            const SizedBox(height: 16.0),
            getCustomFont(label, 14, primaryColor, 1,
                fontWeight: FontWeight.bold)
          ],
        ).paddingAll(16.0)
      ],
    );
  }
}
