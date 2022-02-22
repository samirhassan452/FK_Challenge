import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, Constants, CustomElevatedButtonWidget, CustomTextWidget;
import 'package:flutter/material.dart';

class TryAgainErrorMessageWidget extends StatelessWidget {
  final String errorMsg;
  final VoidCallback onTryAgain;
  const TryAgainErrorMessageWidget({
    Key? key,
    required this.errorMsg,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.semiMediumPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // msg
          CustomTextWidget(errorMsg, fontColor: AppColors.redBrown),
          Constants.verticalSpaceLarge,
          // button
          CustomElevatedButtonWidget(
            btnPressed: onTryAgain,
            btnText: 'Try Again',
          ),
        ],
      ),
    );
  }
}
