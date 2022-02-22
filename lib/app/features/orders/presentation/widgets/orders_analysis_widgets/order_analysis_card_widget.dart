import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, Constants, CustomTextWidget, FONT_WEIGHT;
import 'package:flutter/material.dart';

class OrderAnalysisCardWidget extends StatelessWidget {
  final String label;
  final dynamic value;
  const OrderAnalysisCardWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: AppColors.darkTurquoise,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.dashboard_outlined,
            color: AppColors.white,
            size: 35.0,
          ),
          Constants.verticalSpaceMedium,
          CustomTextWidget(label, fontColor: AppColors.white),
          Constants.verticalSpaceSmall,
          CustomTextWidget(
            "$value",
            fontColor: AppColors.white.withOpacity(0.7),
            fontSize: 20.0,
            fontWeight: FONT_WEIGHT.bold,
          ),
        ],
      ),
    );
  }
}
