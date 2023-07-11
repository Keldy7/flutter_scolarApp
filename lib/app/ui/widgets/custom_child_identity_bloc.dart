import 'package:flutter/material.dart';
import 'package:scolar_pay/app/utils/routes.dart';

import '../../utils/constant.dart';
import '../styles/colors.dart';
import 'bordered_profile_picture.dart';

class CustomChildIdentityBloc extends StatelessWidget {
  final width;
  const CustomChildIdentityBloc({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Constant.goToNextPage(context, Routes.childScreenRoute);
      },
      child: Container(
        decoration: BoxDecoration(
            color: getAccentColor(context),
            borderRadius: BorderRadius.circular(20)),
        width: width,
        height: 130,
        child: LayoutBuilder(builder: (context, boxConstraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.12),
                      ),
                      BorderedProfilePicture(
                          onTap: () {},
                          heightAndWidthPercentage: 0.35,
                          boxConstraints: boxConstraints,
                          imageUrl: "image"),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.075),
                      ),
                      Text(
                        "Nom Prénoms",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.025),
                      ),
                      Text("Class",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
