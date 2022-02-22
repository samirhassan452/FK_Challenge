import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Constants;

class BottomNavigationViewModel {
  Object? getScreenBasedArguments(String? key) {
    switch (key) {
      case Constants.bottomNavigationBarOrdersAnalysisKey:
      // return what you want to this navBar
      case Constants.bottomNavigationBarOrdersStatisticsKey:
      // return what you want to this navBar
      default:
        return null;
    }
  }
}
