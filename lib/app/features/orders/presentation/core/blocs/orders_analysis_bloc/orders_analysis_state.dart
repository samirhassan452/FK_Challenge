part of 'orders_analysis_bloc.dart';

class OrdersAnalysisState extends Equatable {
  final BLOC_STATE_STATUS status;
  final OrdersAnalysisDataEntity? ordersAnalysisData;
  final String? message;
  const OrdersAnalysisState({
    this.status = BLOC_STATE_STATUS.initial,
    this.ordersAnalysisData,
    this.message,
  });

  @override
  List<Object?> get props => [status, ordersAnalysisData, message];

  OrdersAnalysisState copyWith({
    BLOC_STATE_STATUS? status,
    OrdersAnalysisDataEntity? ordersAnalysisData,
    String? message,
  }) =>
      OrdersAnalysisState(
        status: status ?? this.status,
        ordersAnalysisData: ordersAnalysisData ?? this.ordersAnalysisData,
        message: message ?? this.message,
      );
}
