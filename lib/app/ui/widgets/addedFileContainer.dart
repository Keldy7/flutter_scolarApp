import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';

import '../../utils/label_keys.dart';

class AddedFileContainer extends StatelessWidget {
  final Function onAdd;
  const AddedFileContainer({
    Key? key,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async {
          onAdd();
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [10, 10],
          radius: const Radius.circular(15.0),
          color: black40Color.withOpacity(0.3),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width * (0.8),
            height: MediaQuery.sizeOf(context).height * (0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: secondaryColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(0, 1.5),
                            color: black40Color.withOpacity(0.4))
                      ]),
                  width: 25,
                  height: 25,
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * (0.05),
                ),
                Text(
                  Labels.selectionnerKey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: black40Color,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }).paddingOnly(right: 20.w, left: 20.w);
  }
}
