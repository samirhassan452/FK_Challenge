import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show
        GetOrdersAnalysisRequested,
        OrdersAnalysisBloc,
        OrdersAnalysisBodyWidget,
        OrdersAnalysisState,
        OrdersHeaderWidget;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show BLOC_STATE_STATUS, TryAgainErrorMessageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;

class OrdersAnalysisScreen extends StatelessWidget {
  const OrdersAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrdersHeaderWidget(title: "Analysis"),
      body: BlocBuilder<OrdersAnalysisBloc, OrdersAnalysisState>(
        builder: (_, state) {
          switch (state.status) {
            case BLOC_STATE_STATUS.initial:
            case BLOC_STATE_STATUS.loading:
              return const Center(child: CircularProgressIndicator());
            case BLOC_STATE_STATUS.success:
              return OrdersAnalysisBodyWidget(
                ordersAnalysisData: state.ordersAnalysisData!,
              );
            case BLOC_STATE_STATUS.failure:
              return TryAgainErrorMessageWidget(
                errorMsg: state.message!,
                onTryAgain: () {
                  BlocProvider.of<OrdersAnalysisBloc>(context).add(
                    GetOrdersAnalysisRequested(),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
