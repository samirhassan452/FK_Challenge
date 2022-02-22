part of 'orders_graph_bloc.dart';

abstract class OrdersGraphEvent extends Equatable {
  const OrdersGraphEvent();

  @override
  List<Object> get props => [];
}

class GetOrdersGraphRequested extends OrdersGraphEvent {}
