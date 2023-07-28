import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/constant.dart';
import '../../../utils/widget_utils.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final List<String> tabList = [
    Labels.faqKey,
    Labels.contactUsKey,
  ];

  @override
  Widget build(BuildContext context) {
    RxInt selectedTab = 0.obs;

    return getScreenDetailDefaultView(context, Labels.helpCenterKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      buildTabView(tabList, context, selectedTab),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
