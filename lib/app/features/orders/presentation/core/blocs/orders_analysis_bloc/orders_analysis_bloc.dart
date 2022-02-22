import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show GetOrders, OrdersAnalysisDataEntity, OrderEntity;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show BLOC_STATE_STATUS, Constants, Failure, LoadFailure, NoParams;
import 'package:intl/intl.dart' show NumberFormat;

part 'orders_analysis_event.dart';
part 'orders_analysis_state.dart';

class OrdersAnalysisBloc
    extends Bloc<OrdersAnalysisEvent, OrdersAnalysisState> {
  // use case
  final GetOrders _getOrders;
  OrdersAnalysisBloc({required GetOrders getOrders})
      : _getOrders = getOrders,
        super(const OrdersAnalysisState()) {
    on<GetOrdersAnalysisRequested>((event, emit) async {
      emit(state.copyWith(status: BLOC_STATE_STATUS.loading));
      final failureOrOrders = await _getOrders(NoParams());
      failureOrOrders.fold(
        (failure) => emit(state.copyWith(
          status: BLOC_STATE_STATUS.failure,
          message: _mapFailureToMessage(failure),
        )),
        (orders) => emit(state.copyWith(
          status: BLOC_STATE_STATUS.success,
          ordersAnalysisData: OrdersAnalysisDataEntity(
            totalCount: orders.length,
            avgPrice: _calculateAvgPrice(orders),
            numOfReturns: _getNumOfReturns(orders),
          ),
        )),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LoadFailure:
        return Constants.loadFileFailureMsg;
      default:
        return Constants.unExpectedFailureMsg;
    }
  }

  String _calculateAvgPrice(List<OrderEntity> orders) {
    double priceSum = 0.0;
    for (var order in orders) {
      final parcedPrice = NumberFormat.simpleCurrency().parse(order.price);
      priceSum += parcedPrice;
    }
    final fixedDouble = (priceSum / orders.length).toStringAsFixed(3);
    final parsedDouble = double.tryParse(fixedDouble) ?? 0.0;
    final formatedPrice = NumberFormat.simpleCurrency().format(parsedDouble);
    return formatedPrice;
  }

  int _getNumOfReturns(List<OrderEntity> orders) =>
      orders.where((order) => order.status == "RETURNED").toList().length;
}
