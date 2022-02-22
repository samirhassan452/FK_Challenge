import 'package:flutter/material.dart';
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show CustomTextWidget, FONT_WEIGHT;

class NotFoundTitleWidget extends StatelessWidget {
  const NotFoundTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextWidget(
      "Opps, this page does not exist",
      fontColor: Colors.black54,
      fontWeight: FONT_WEIGHT.bold,
      fontSize: 20.0,
    );
  }
}
