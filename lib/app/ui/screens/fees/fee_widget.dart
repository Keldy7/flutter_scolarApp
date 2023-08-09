import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';

class FeeButton extends StatelessWidget {
  const FeeButton(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onPress})
      : super(key: key);
  final String title;
  final IconData iconData;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 150.w,
        height: 27.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6789CA), Color(0xFF345FB4)],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            Icon(
              iconData,
              color: redColor,
              size: 26.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class FeeDetailRow extends StatelessWidget {
  const FeeDetailRow({Key? key, required this.title, required this.statusValue})
      : super(key: key);
  final String title;
  final String statusValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: blackColor,
                fontWeight: FontWeight.w900,
              ),
        ),
        Text(statusValue, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
