import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CardCategory extends StatelessWidget {
  final String title;
  final Function? onTapWigdet;
  const CardCategory( {
    Key? key,
    required this.title, this.onTapWigdet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return 
      ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: lightAccentColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: shadowLigthColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (onTapWigdet != null) {
                  onTapWigdet?.call();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: accentColor),
                      ),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: accentColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
