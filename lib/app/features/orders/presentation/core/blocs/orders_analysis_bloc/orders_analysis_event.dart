part of 'orders_analysis_bloc.dart';

abstract class OrdersAnalysisEvent extends Equatable {
  const OrdersAnalysisEvent();

  @override
  List<Object> get props => [];
}

class GetOrdersAnalysisRequested extends OrdersAnalysisEvent {}
