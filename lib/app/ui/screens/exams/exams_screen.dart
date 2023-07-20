import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/utils/constant.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';

import '../../../utils/widget_utils.dart';

class ExamenScreen extends StatefulWidget {
  const ExamenScreen({super.key});

  @override
  State<ExamenScreen> createState() => _ExamenScreenState();
}

class _ExamenScreenState extends State<ExamenScreen> {
  final List<String> tabList = [Labels.examensKey, Labels.compositionsKey];

  @override
  Widget build(BuildContext context) {
    RxInt selectedTab = 0.obs;

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
                buildTabView(tabList, context, selectedTab),
                // ObxValue(
                //           (p0) => Expanded(
                //                 flex: 1,
                //                 child: tabDetail[selectedTab.value],
                //               ),
                //           selectedTab)
              ],
            ))
          ],
        ));
  }

  
}
