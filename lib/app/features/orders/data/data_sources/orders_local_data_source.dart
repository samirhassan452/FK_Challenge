import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrderModel;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Constants, JsonCoder, LoadException;
import 'package:flutter/services.dart';

abstract class OrdersLocalDataSource {
  Future<List<OrderModel>> getOrders();
}

class OrdersLocalDataSourceImplementation implements OrdersLocalDataSource {
  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      const fileName = Constants.ordersJson;
      final jsonOrders = await rootBundle.loadString(fileName);
      final decodedOrders = JsonCoder.modelFromJson(jsonOrders) as List;
      return OrderModel.getListOfOrders(decodedOrders);
    } catch (_) {
      throw LoadException();
    }
  }
}
