import 'package:flutter/material.dart';
import 'package:flapkap_challenge/app/features/error/error_exports.dart'
    show
        NotFoundSubTitleWidget,
        NotFoundSupportAccountWidget,
        NotFoundTitleWidget;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Constants, CustomIconButtonWidget, CustomTextWidget, Helpers;

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Helpers.backNavigationToSpecificScreen();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: CustomIconButtonWidget(
            btnPressed: () => Helpers.backNavigationToSpecificScreen(),
            materialIcon: Icons.arrow_back_ios_new,
            materialIconColor: Colors.white,
            materialIconSize: 20.0,
          ),
          centerTitle: true,
          title: const CustomTextWidget(
            "Page",
            fontColor: Colors.white,
            fontSize: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.semiLargePadding,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NotFoundTitleWidget(),
                Constants.verticalSpaceSmall,
                NotFoundSubTitleWidget(),
                Constants.verticalSpaceMedium,
                NotFoundSupportAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
