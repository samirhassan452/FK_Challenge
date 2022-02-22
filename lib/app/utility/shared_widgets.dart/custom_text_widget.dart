import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, Constants, FONT_WEIGHT;
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final FONT_WEIGHT fontWeight;
  final Color fontColor;
  final double height;
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final double textDecorationThickness;
  final Color? textDecorationColor;
  final TextDirection? textDirection;
  final int? maxLines;
  final double? letterSpacing;
  const CustomTextWidget(
    this.text, {
    Key? key,
    this.fontSize = 16.0,
    this.fontFamily = Constants.cairoFontType,
    this.fontWeight = FONT_WEIGHT.medium,
    this.fontColor = AppColors.black,
    this.height = 1.0,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.visible,
    this.textDecoration = TextDecoration.none,
    this.textDecorationThickness = 1.5,
    this.textDecorationColor,
    this.textDirection,
    this.maxLines,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      textDirection: textDirection,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: _getFontFamily(),
        fontWeight: _getFontWeight(),
        color: fontColor,
        height: height,
        decoration: textDecoration,
        decorationThickness: textDecorationThickness,
        decorationColor: textDecorationColor ?? fontColor,
        letterSpacing: letterSpacing,
      ),
    );
  }

  String? _getFontFamily() {
    if (fontFamily.isNotEmpty) {
      return fontFamily;
    }
  }

  FontWeight _getFontWeight() {
    switch (fontWeight) {
      case FONT_WEIGHT.regular:
        return FontWeight.w300;
      case FONT_WEIGHT.medium:
        return FontWeight.w500;
      case FONT_WEIGHT.bold:
        return FontWeight.w700;
      case FONT_WEIGHT.black:
        return FontWeight.w900;
    }
  }

  // bool isNumeric() => num.tryParse(text) != null;
}
