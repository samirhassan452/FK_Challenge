import 'package:dartz/dartz.dart' show Either;
import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrderEntity;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Failure;

abstract class OrdersRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, List<OrderEntity>>> getOrdersAnalysis();
  Future<Either<Failure, List<OrderEntity>>> getOrdersGraph();
}
