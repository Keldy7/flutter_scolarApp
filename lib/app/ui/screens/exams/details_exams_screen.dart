import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../utils/constant.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';
import '../../styles/colors.dart';

class DetailExamsScreen extends StatefulWidget {
  const DetailExamsScreen({super.key});

  @override
  State<DetailExamsScreen> createState() => _DetailExamsScreenState();
}

class _DetailExamsScreenState extends State<DetailExamsScreen>
    with TickerProviderStateMixin {
  int note = 62;
  int countList = 4;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    // double height = MediaQuery.sizeOf(context).height;

    return getScreenDetailDefaultView(context, Labels.resultatsKey, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                20.h.verticalSpace,
                Container(
                    width: width,
                    decoration: getButtonDecoration(getCardColor(context),
                        withCorners: true,
                        corner: 20.h,
                        withBorder: true,
                        borderColor: accentColor,
                        shadow: [
                          const BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(-4, 5),
                              blurRadius: 16)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTitles(context, Labels.matieresKey,
                            subTitle: Labels.noteKey,
                            sizeTitle: 18,
                            withPadding: false),
                        Column(
                            children: List.generate(countList, (index) {
                          return ListTile(
                            title: buildTitles(context, "Anglais",
                                subTitle: "$note",
                                sizeTitle: 16,
                                withPadding: false),
                            subtitle: Container(
                              height: 10,
                              child: LinearProgressIndicator(
                                value: note / 100,
                                valueColor: AlwaysStoppedAnimation<Color?>(
                                    secondaryColor),
                                backgroundColor:
                                    lightOrangeColor.withOpacity(.5),
                              ),
                            ),
                          );
                        })),
                        getDivider().marginSymmetric(vertical: 15.h),
                        buildTitles(context, Labels.totalNotesKey,
                            subTitle: "= ${note * countList}",
                            sizeTitle: 18,
                            withPadding: false),
                      ],
                    ).paddingAll(15)),
                40.h.verticalSpace,
                Container(
                    width: width,
                    decoration: getButtonDecoration(getCardColor(context),
                        withCorners: true,
                        corner: 20.h,
                        withBorder: true,
                        borderColor: accentColor,
                        shadow: [
                          const BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(-4, 5),
                              blurRadius: 16)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTitle(context, Labels.mentionAppreciationKey,
                            withPadding: false),
                        10.h.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  15.h.verticalSpace,
                                  getCustomFont(
                                      "${Constant.addColonToLabel(Labels.mentionKey)} Passable",
                                      16,
                                      secondaryColor,
                                      2,
                                      fontWeight: FontWeight.w600),
                                  getMultilineCustomFont(
                                      "Mes encouragements sincères. Elève studieux et attentif mais peut mieux faire encore.",
                                      15,
                                      black40Color,
                                      isItalic: true)
                                ],
                              ),
                            ),
                            // Spacer(),
                            Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Center(
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 135,
                                              height: 135,
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(100.0),
                                                ),
                                                border: Border.all(
                                                    width: 3,
                                                    color: accentColor
                                                        .withOpacity(0.15)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '15,43',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                          color: redColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' / 20',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: greyColor
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '1er',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: black40Color,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' / 32',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: greyColor
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          CustomPaint(
                                            painter: CurvePainter(
                                                colors: [
                                                  lightAccentColor,
                                                  accentColor,
                                                  accentColor
                                                ],
                                                angle: 140 +
                                                    (360 - 100) * (1.0 - 1.0)),
                                            child: const SizedBox(
                                              width: 150,
                                              height: 150,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ).paddingAll(15))
              ],
            ))
          ],
        ).paddingSymmetric(horizontal: 15));
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([primaryColor, primaryColor]);
    }

    final shdowPaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = greyColor.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = greyColor.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = greyColor.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    const gradient1 = SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = Paint();
    cPaint.shader = gradient1.createShader(rect);
    cPaint.color = primaryColor;
    cPaint.strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(const Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
