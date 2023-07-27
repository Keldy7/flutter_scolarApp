import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../utils/image_keys.dart';
import '../../../utils/label_keys.dart';
import '../../../utils/widget_utils.dart';
import '../../controllers/image_controller.dart';
import '../../styles/colors.dart';


class EditProfile extends StatelessWidget {
  final imageController = Get.put(ImageController());

  EditProfile({super.key});

  onBackClick(BuildContext context) {
    // Get.delete<ImageController>();
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    double horSpace = Constant.getDefaultHorSpaceFigma(context);

    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    emailController.text = 'estherhoward@gmail.com';
    nameController.text = 'Esther Howard';
    phoneController.text = '(302) 555-0107';

    return getScreenDetailDefaultView(
      context,
      Labels.editProfilKey,
      () {
        onBackClick(context);
      },
      Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              children: [
                50.h.verticalSpace,
                getProfileCell(context),
                40.h.verticalSpace,
                getDefaultTextFiled(
                  context,
                  Labels.nomKey,
                  nameController,
                  getFontGreyColor(context),
                  (value) {},
                ),
                20.h.verticalSpace,
                getDefaultTextFiled(
                  context,
                  Labels.numTelephoneKey,
                  phoneController,
                  getFontGreyColor(context),
                  (value) {},
                ),
                20.h.verticalSpace,
                getDefaultTextFiled(
                  context,
                  Labels.adrMailKey,
                  emailController,
                  getFontGreyColor(context),
                  (value) {},
                ),
                20.h.verticalSpace,
              ],
            ),
          ),
          getButtonFigma(
            context,
            getAccentColor(context),
            true,
            Labels.saveProfilKey,
            primaryColor,
            () {
              onBackClick(context);
            },
            EdgeInsets.zero,
          ).marginSymmetric(horizontal: horSpace),
          30.h.verticalSpace,
        ],
      ),
    );
  }

  getProfileCell(BuildContext context) {
    return Center(
      child: Container(
        width: 100.h,
        height: 100.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Obx(
                    () => getCircleImage(
                      context,
                      (imageController.imagePath.value.isNotEmpty)
                          ? imageController.imagePath.value
                          : Images.profileJpg
                          ,
                      100.h,
                      fileImage: (imageController.imagePath.value.isNotEmpty),
                    ),
                  )),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    imageController.getImage();
                  },
                  child: Container(
                    width: 32.h,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x2d7a6054),
                          blurRadius: 23,
                          offset: Offset(1, 8),
                        ),
                      ],
                      color: primaryColor,
                    ),
                    child: Center(
                      child: getSvgImage(
                        context,
                        Images.cameraSvg,
                        18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
