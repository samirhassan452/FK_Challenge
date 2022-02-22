import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrdersAnalysisScreen, OrdersGraphScreen;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Constants;
import 'package:flutter/material.dart' show SizedBox;
// import 'package:flutter/cupertino.dart';

class BottomNavigationMapping {
  static mapStringKeyToScreen(String key, {dynamic arguments}) {
    switch (key) {
      case Constants.bottomNavigationBarOrdersAnalysisKey:
        return const OrdersAnalysisScreen();
      case Constants.bottomNavigationBarOrdersStatisticsKey:
        return const OrdersGraphScreen();
      default:
        return const SizedBox();
    }
  }
}
