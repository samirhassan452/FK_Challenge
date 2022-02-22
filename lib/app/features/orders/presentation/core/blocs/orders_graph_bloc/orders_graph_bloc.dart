import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show GetOrders, OrderEntity, OrdersGraphStatisticsEntity;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show BLOC_STATE_STATUS, Constants, Failure, LoadFailure, NoParams;
import 'package:intl/intl.dart' show DateFormat;

part 'orders_graph_event.dart';
part 'orders_graph_state.dart';

class OrdersGraphBloc extends Bloc<OrdersGraphEvent, OrdersGraphState> {
  // use case
  final GetOrders _getOrders;
  OrdersGraphBloc({required GetOrders getOrders})
      : _getOrders = getOrders,
        super(const OrdersGraphState()) {
    on<GetOrdersGraphRequested>((event, emit) async {
      emit(state.copyWith(status: BLOC_STATE_STATUS.loading));
      final failureOrOrders = await _getOrders(NoParams());
      failureOrOrders.fold(
        (failure) => emit(state.copyWith(
          status: BLOC_STATE_STATUS.failure,
          message: _mapFailureToMessage(failure),
        )),
        (orders) => emit(state.copyWith(
          status: BLOC_STATE_STATUS.success,
          ordersGraphStatistics: _getOrdersStatisitcs(orders),
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

  List<OrdersGraphStatisticsEntity> _getOrdersStatisitcs(
    List<OrderEntity> orders,
  ) {
    List<OrdersGraphStatisticsEntity> listOfStats = [];

    // old solution "works but return the same length of list which is 100"
    /* for (var outerOrder in orders) {
      final outerParsedDate = DateTime.parse(outerOrder.registered);
      // final outerFormattedDate =
      //     DateFormat("yyyy-MM-dd HH:mm:ss a").format(outerParsedDate);
      final outerFormattedYearMonth = DateFormat.yM().format(outerParsedDate);
      // search about matched formattedYearMonth
      final numOfOrders = orders.where((innerOrder) {
        final innerParsedDate = DateTime.parse(innerOrder.registered);
        final innerFormattedYearMonth = DateFormat.yM().format(innerParsedDate);
        return innerFormattedYearMonth == outerFormattedYearMonth;
      }).toList();
      if (numOfOrders.isNotEmpty) {
        listOfStats.add(OrdersGraphStatisticsEntity(
          month: outerParsedDate.month,
          yearMonth: outerFormattedYearMonth,
          numOfOrders: numOfOrders.length,
        ));
      }
    }
    listOfStats.sort((a, b) => a.month.compareTo(b.month)); */

    // new solution "which length will be only the number of months in a year"
    // sort orders based date
    final orderedOrders = orders;
    orderedOrders.sort((a, b) => a.registered.compareTo(b.registered));
    // create map to count items' occurence in a List
    var map = {};
    // count items' occurence
    for (var order in orderedOrders) {
      final firstParsedDate = DateTime.parse(order.registered);
      final firstFormattedYearMonth = DateFormat.yM().format(firstParsedDate);
      if (map.containsKey(firstFormattedYearMonth)) {
        map[firstFormattedYearMonth] += 1;
      } else {
        map[firstFormattedYearMonth] = 1;
      }
    }
    // assign data to list
    map.forEach((date, numOfOrders) {
      listOfStats.add(OrdersGraphStatisticsEntity(
        month: DateFormat("MM/yyyy").parse(date).month,
        yearMonth: date,
        numOfOrders: numOfOrders,
      ));
    });
    return listOfStats;
  }
}
