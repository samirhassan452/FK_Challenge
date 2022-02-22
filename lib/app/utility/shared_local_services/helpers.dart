import 'dart:developer' as devtools show log;

import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show NavigationService, RoutesNames;

// use it insead of print() or debugPrint()
extension Log<T extends Object> on T {
  void log() {
    devtools.log(toString());
  }
}

class Helpers {
  static void backNavigationToSpecificScreen({
    String? navigationKey,
    Object? arguments,
  }) {
    if (NavigationService.navigatorKey.currentState!.canPop()) {
      NavigationService.navigatorKey.currentState!.pop();
    } else {
      NavigationService.navigatorKey.currentState!.pushNamedAndRemoveUntil(
        // navigationKey ?? RoutesNames.BOTTOM_NAVIGATION_ROUTE,
        navigationKey ?? RoutesNames.bottomNavigationRoute,
        (route) => false,
        arguments: arguments,
      );
    }
  }
}
