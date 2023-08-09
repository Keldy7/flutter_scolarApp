// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/fake_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';
import '../../models/model_options_contact_us.dart';

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
  final List<Widget> tabDetail = [
    ContactUs(),
    ContactUs(),
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
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      buildTabView(tabList, context, selectedTab),
                      ObxValue(
                          (p0) => tabDetail[selectedTab.value], selectedTab)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}


class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  List<ModelOptions> allOptionsList = FakeData.getAllOptionsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(allOptionsList.length, (int index) {
        ModelOptions allOptions = allOptionsList[index];
        return getProfileRowContainer(context, () {}, allOptions.title,
            iconName: allOptions.icon);
      }),
    );
  }
}
