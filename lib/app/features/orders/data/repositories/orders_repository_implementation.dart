import 'package:flapkap_challenge/app/features/orders/domain/entities/order_entity.dart'
    show OrderEntity;
import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrdersLocalDataSource, OrdersRepository;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Failure, LoadException, LoadFailure;

class OrdersRepositoryImplementation implements OrdersRepository {
  final OrdersLocalDataSource localDataSource;

  OrdersRepositoryImplementation({required this.localDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() => _getOrders();

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrdersAnalysis() =>
      _getOrders();

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrdersGraph() => _getOrders();

  Future<Either<Failure, List<OrderEntity>>> _getOrders() async {
    try {
      final localOrders = await localDataSource.getOrders();
      return Right(localOrders);
    } on LoadException {
      return Left(LoadFailure());
    }
  }
}
