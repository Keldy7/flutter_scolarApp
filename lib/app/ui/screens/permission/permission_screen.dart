import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/image_keys.dart';
import 'package:scolar_pay/app/utils/label_keys.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

import '../../../utils/constant.dart';
import '../../../utils/routes.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool isScrolled = true;
  final List<String> tabList = [
    Labels.historiqueKey,
    Labels.enAttenteKey,
    Labels.accepterKey
  ];
  final List<Widget> tabDetail = [
    HistoryListWidget(),
    HistoryListWidget(),
    HistoryListWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    RxInt selectedTab = 0.obs;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: getAccentColor(context),
          appBar: getBackAppBar(context, () {
            Constant.goToNextPage(context, Routes.childScreenRoute);
          },
              subtitle: true,
              withLeading: true,
              subtitleText: '',
              title: Labels.permissionsKey,
              actionImg: Images.filterIconSvg,
              iconColor: primaryColor,
              centerTitle: true),
          floatingActionButton: FloatingActionButton.extended(
            splashColor: black40Color,
            onPressed: () {
              Constant.goToNextPage(context, Routes.addPermissionsScreenRoute);
            },
            elevation: 10,
            isExtended: isScrolled,
            backgroundColor: accentColor,
            foregroundColor: primaryColor,
            icon: Icon(
              Icons.add,
              color: primaryColor,
              size: 30,
              weight: 20,
            ),
            label: getCustomFont(
                Labels.demanderPermissionKey, 15, primaryColor, 1,
                fontWeight: FontWeight.w700),
          ),
          body: getDefaultContainerView(
              context,
              NotificationListener<UserScrollNotification>(
                onNotification: (notif) {
                  if (notif.direction == ScrollDirection.reverse) {
                    setState(() {
                      isScrolled = false;
                    });
                  } else if (notif.direction == ScrollDirection.forward) {
                    setState(() {
                      isScrolled = true;
                    });
                  }
                  return true;
                },
                child: Column(
                  children: [
                    buildTabView(tabList, context, selectedTab),
                    ObxValue(
                        (p0) => Expanded(
                              flex: 1,
                              child: tabDetail[selectedTab.value],
                            ),
                        selectedTab)
                  ],
                ).paddingAll(4.h),
              )),
        ),
        onWillPop: () async {
          Constant.backToPrev(context);
          return false;
        });
  }

  
  _buildListItems(BuildContext context,
      {required IconData iconName,
      required Color primColor,
      required String titleAdvice,
      required String dateAdvice}) {
    return Container(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: black40Color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    iconName,
                    color: primColor,
                    size: 25,
                  )
                ],
              ),
            ),
            title: getCustomFont(titleAdvice, 20, blackColor, 1, fontWeight: FontWeight.w500),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont(dateAdvice, 15, backgroundColor.withOpacity(.6), 1).paddingOnly(top: 8.0),
              ],
            ),
          ).paddingAll(10),
        )).paddingOnly(top: 20);
  }
}

class HistoryListWidget extends StatelessWidget {
  final List<String> myBooking = ["erty", "ryy", "ryy"];

  @override
  Widget build(BuildContext context) {
    return (myBooking.isEmpty)
        ? buildNoDataWidget(context)
        : ListView.builder(
            itemBuilder: (context, index) {
              return buildBookingHistoryItem(context, isComplete: index != 1);
            },
            primary: true,
            padding: EdgeInsets.zero,
            itemCount: myBooking.length,
            shrinkWrap: true,
          );
  }

  Wrap buildNoDataWidget(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: [
        getAssetImage(context, Images.noBookingPng, 100.h, 132.h,
            boxFit: BoxFit.fitHeight),
        getCustomFont(Labels.noPermissionsKey, 20, getFontColor(context), 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center)
            .marginOnly(top: 30.h)
      ],
    );
  }

  Container buildBookingHistoryItem(BuildContext context,
      {bool fromActive = false, bool isComplete = true}) {
    double horSpace = Constant.getDefaultHorSpaceFigma(context);
    return Container(
      width: double.infinity,
      height: 162.h,
      margin: EdgeInsets.symmetric(horizontal: horSpace, vertical: 10.h),
      padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
      decoration: getButtonDecoration(getCardColor(context),
          withCorners: true,
          corner: 20.h,
          shadow: [
            const BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(-4, 5),
                blurRadius: 16)
          ]),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: getCustomFont(
                        "Titre Permission",
                        16,
                        getFontColor(context),
                        1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("tap delete");
                      },
                      child: getSvgImageWithSize(
                          context, Images.trashSvg, 23.h, 23.h,
                          fit: BoxFit.fill),
                    )
                  ],
                ),
                10.h.verticalSpace,
                getCustomFont(
                  "Bonjour cher DG de l'extra, je voudrais prendre une permission pour l'enfant KK. En il a un rdv chez son dentiste",
                  14,
                  getFontColor(context),
                  2,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 18.h,
                  color: secondaryColor,
                ),
                8.w.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: getCustomFont(
                      "22 Juin, 2023, 9:00", 14, "#8A6E6E".toColor(), 1,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontsFamilyLato),
                ),
                (!fromActive)
                    ? Container(
                        width: 102.h,
                        height: 32.h,
                        decoration: getButtonDecoration(
                          (isComplete) ? lightGreenColor : lightOrangeColor,
                          withCorners: true,
                          corner: 16.h,
                        ),
                        child: Center(
                          child: getCustomFont(
                              (isComplete)
                                  ? Labels.permissionAccepteeKey
                                  : Labels.enAttenteKey,
                              16,
                              (isComplete) ? greenColor : orangeColor,
                              1,
                              fontWeight: FontWeight.w600,
                              fontFamily: Constant.fontsFamilyLato),
                        ),
                      )
                    : 0.horizontalSpace
              ],
            ),
          ),
        ],
      ),
    );
  }
}
