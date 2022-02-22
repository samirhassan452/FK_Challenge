import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrderAnalysisCardWidget, OrdersAnalysisDataEntity;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show Constants;
import 'package:flutter/material.dart';

class OrdersAnalysisBodyWidget extends StatelessWidget {
  final OrdersAnalysisDataEntity ordersAnalysisData;
  const OrdersAnalysisBodyWidget({
    Key? key,
    required this.ordersAnalysisData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.symmetric(
        vertical: Constants.mediumPadding,
        horizontal: Constants.semiMediumPadding,
      ),
      physics: const BouncingScrollPhysics(),
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      children: [
        OrderAnalysisCardWidget(
          label: "Total Count",
          value: ordersAnalysisData.totalCount,
        ),
        OrderAnalysisCardWidget(
          label: "Average Price",
          value: ordersAnalysisData.avgPrice,
        ),
        OrderAnalysisCardWidget(
          label: "num of Returns",
          value: ordersAnalysisData.numOfReturns,
        ),
      ],
    );
    /* return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.mediumPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget("Total Count: $totalCount", fontSize: 20.0),
          Constants.verticalSpaceMedium,
          CustomTextWidget("Average Price: $avgPrice", fontSize: 20.0),
          Constants.verticalSpaceMedium,
          CustomTextWidget("Number of Returns: $numOfReturns", fontSize: 20.0),
        ],
      ),
    ); */
  }
}
