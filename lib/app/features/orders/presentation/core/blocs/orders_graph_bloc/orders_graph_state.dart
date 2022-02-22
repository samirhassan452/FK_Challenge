part of 'orders_graph_bloc.dart';

class OrdersGraphState extends Equatable {
  final BLOC_STATE_STATUS status;
  final List<OrdersGraphStatisticsEntity>? ordersGraphStatistics;
  final String? message;
  const OrdersGraphState({
    this.status = BLOC_STATE_STATUS.initial,
    this.ordersGraphStatistics,
    this.message,
  });

  @override
  List<Object?> get props => [status, ordersGraphStatistics, message];

  OrdersGraphState copyWith({
    BLOC_STATE_STATUS? status,
    List<OrdersGraphStatisticsEntity>? ordersGraphStatistics,
    String? message,
  }) =>
      OrdersGraphState(
        status: status ?? this.status,
        ordersGraphStatistics:
            ordersGraphStatistics ?? this.ordersGraphStatistics,
        message: message ?? this.message,
      );
}
