import 'package:flutter/material.dart' show SizedBox;

class Constants {
  /// app config
  static const String cairoFontType = 'Cairo';
  static const String logoImg = 'assets/images/logo.png';
  static const String textLogoImg = 'assets/images/text_logo.png';

  /// vertical space
  static const SizedBox verticalSpaceSmall = SizedBox(height: 12.0);
  static const SizedBox verticalSpaceMedium = SizedBox(height: 24.0);
  static const SizedBox verticalSpaceLarge = SizedBox(height: 60.0);

  /// horizontal space
  static const SizedBox horizontalSpaceSmall = SizedBox(width: 12.0);
  static const SizedBox horizontalSpaceMedium = SizedBox(width: 24.0);
  static const SizedBox horizontalSpaceLarge = SizedBox(width: 60.0);

  /// Default padding
  static const double semiSmallPadding = 8.0;
  static const double smallPadding = 12.0;
  static const double semiMediumPadding = 18.0;
  static const double mediumPadding = 24.0;
  static const double semiLargePadding = 32.0;
  static const double largePadding = 60.0;

  /// keys
  static const String bottomNavigationBarOrdersAnalysisKey = 'orders-analysis';
  static const String bottomNavigationBarOrdersStatisticsKey =
      'orders-statistics';

  /// icons

  /// images
  static const String statisticsImg = 'assets/images/statistics_img.png';
  static const String dataAnalysisImg = 'assets/images/data_analysis_img.png';

  /// jsons
  static const String ordersJson = 'assets/jsons/orders.json';

  /// failures
  static const String loadFileFailureMsg = 'Load File Failure';
  static const String unExpectedFailureMsg = 'Unexpected Error';
}
