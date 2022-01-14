import 'package:flutter/material.dart';
import 'package:flutter_web/ThemeData/dimensions.dart';

import 'ThemeData/app_colors.dart';

class HeadingTitleText extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String title;
  final double padding;

  const HeadingTitleText({
    Key? key,
    required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.color = AppColors.profileEnabled,
    required this.title,
    this.padding = PaddingSize.extraSmall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        title.toLowerCase(),
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
