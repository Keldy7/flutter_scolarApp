import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/image_keys.dart';
import '../styles/colors.dart';


class BorderedProfilePicture extends StatelessWidget {
  final BoxConstraints boxConstraints;
  final String? imageUrl;
  final Function? onTap;
  final double? heightAndWidthPercentage;
  const BorderedProfilePicture(
      {Key? key,
      required this.boxConstraints,
      this.imageUrl,
      this.heightAndWidthPercentage,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(boxConstraints.maxWidth *
          (heightAndWidthPercentage == null
              ? Constant.defaultProfilePictureHeightAndWidthPercentage * (0.5)
              : heightAndWidthPercentage! * (0.5))),
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 1.0, color: secondaryColor)),
        width: boxConstraints.maxWidth *
            (heightAndWidthPercentage ??
                Constant.defaultProfilePictureHeightAndWidthPercentage),
        height: boxConstraints.maxWidth *
            (heightAndWidthPercentage ??
                Constant.defaultProfilePictureHeightAndWidthPercentage),
        child: Container(
            decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: imageUrl != null
              ? DecorationImage(
                  image: AssetImage(Constant.getImagePngPath(
                      Images.boyPng)))
              : DecorationImage(
                  image: AssetImage(Constant.getImagePngPath(Images.girlPng))),
        )),
      ),
    );
  }
}
