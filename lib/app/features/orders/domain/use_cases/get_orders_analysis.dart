import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrderEntity, OrdersRepository;
import 'package:flapkap_challenge/app/utility/errors/failures.dart'
    show Failure;
import 'package:dartz/dartz.dart' show Either;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show NoParams, UseCase;

class GetOrdersAnalysis with UseCase<List<OrderEntity>, NoParams> {
  final OrdersRepository ordersRepository;

  GetOrdersAnalysis({required this.ordersRepository});

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) async {
    return await ordersRepository.getOrdersAnalysis();
  }
}
