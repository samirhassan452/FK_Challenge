import 'package:flutter/material.dart';
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, CustomTextWidget, FONT_WEIGHT;

class CustomTextButtonWidget extends StatelessWidget {
  final VoidCallback btnPressed;
  final String btnText;
  final Color btnTextColor;
  final FONT_WEIGHT btnTextWeight;
  final double btnTextSize;
  final bool haveUnderline;
  final Color? underlineColor;
  final AlignmentGeometry? alignment;
  const CustomTextButtonWidget({
    Key? key,
    required this.btnPressed,
    required this.btnText,
    this.btnTextColor = AppColors.black,
    this.btnTextWeight = FONT_WEIGHT.bold,
    this.btnTextSize = 18.0,
    this.haveUnderline = false,
    this.underlineColor,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: btnPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
      ),
      child: CustomTextWidget(
        btnText,
        fontColor: btnTextColor,
        fontWeight: btnTextWeight,
        fontSize: btnTextSize,
        textDecoration:
            haveUnderline ? TextDecoration.underline : TextDecoration.none,
        textDecorationColor: underlineColor,
      ),
    );
  }
}

class CustomElevatedButtonWidget extends StatelessWidget {
  final VoidCallback? btnPressed;
  final Color btnColor;
  final double btnHeight;
  final double btnWidth;
  final double btnRadius;
  final Color? btnBorderColor;
  final double btnBorderWidth;
  final double btnElevation;
  final AlignmentGeometry btnAlignment;
  final String btnText;
  final Color btnTextColor;
  final FONT_WEIGHT btnTextWeight;
  final double btnTextSize;
  final bool btnTextUnderline;
  final Color? btnTextUnderlineColor;
  const CustomElevatedButtonWidget({
    Key? key,
    required this.btnPressed,
    this.btnColor = AppColors.darkTurquoise,
    this.btnHeight = 70.0,
    this.btnWidth = double.infinity,
    this.btnRadius = 2.5,
    this.btnBorderColor,
    this.btnBorderWidth = 1.0,
    this.btnElevation = 2.0,
    this.btnAlignment = Alignment.center,
    required this.btnText,
    this.btnTextColor = AppColors.white,
    this.btnTextWeight = FONT_WEIGHT.medium,
    this.btnTextSize = 18.0,
    this.btnTextUnderline = false,
    this.btnTextUnderlineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: btnColor, // background
        // onPrimary: Colors.yellow, // foreground
        alignment: btnAlignment,
        elevation: btnElevation,
        minimumSize: Size(btnWidth, btnHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius),
        ),
        side: BorderSide(
          width: btnBorderWidth,
          color: btnBorderColor ?? btnColor,
        ),
        // padding: Edge
      ),
      onPressed: btnPressed,
      child: CustomTextWidget(
        btnText,
        fontColor: btnTextColor,
        fontWeight: btnTextWeight,
        fontSize: btnTextSize,
        textDecoration:
            btnTextUnderline ? TextDecoration.underline : TextDecoration.none,
        textDecorationColor: btnTextUnderlineColor,
        textAlign: TextAlign.center,
        height: 1.2,
      ),
    );
  }
}

class CustomIconButtonWidget extends StatelessWidget {
  final Color? btnBackgroundColor;
  final Color? btnEffectColor;
  final double btnWidth;
  final double btnHeight;
  final VoidCallback btnPressed;
  final Color btnBorderColor;
  final IconData materialIcon;
  final Color materialIconColor;
  final double materialIconSize;
  const CustomIconButtonWidget({
    Key? key,
    required this.btnPressed,
    required this.materialIcon,
    this.btnBorderColor = Colors.transparent,
    this.btnBackgroundColor,
    this.btnEffectColor,
    this.btnHeight = 24.0,
    this.btnWidth = 24.0,
    this.materialIconColor = AppColors.black,
    this.materialIconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: btnEffectColor,
      highlightColor: btnEffectColor,
      onTap: btnPressed,
      child: Container(
        width: btnWidth,
        height: btnHeight,
        decoration: BoxDecoration(
          color: btnBackgroundColor,
          border: Border.all(color: btnBorderColor),
        ),
        child: Icon(
          materialIcon,
          color: materialIconColor,
          size: materialIconSize,
        ),
      ),
    );
  }
}
