import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrdersGraphStatisticsEntity, OrdersGraphViewModel;
import 'package:flapkap_challenge/app/utility/utility_exports.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrdersGraphBodyWidget extends StatelessWidget {
  final List<OrdersGraphStatisticsEntity> ordersGraphStatistics;
  const OrdersGraphBodyWidget({
    Key? key,
    required this.ordersGraphStatistics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: Constants.mediumPadding,
        horizontal: Constants.smallPadding,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: AppColors.blueBlack1,
      elevation: 4.0,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(labelRotation: -65),
        legend: Legend(
          isVisible: true,
          textStyle: const TextStyle(
            color: AppColors.darkGreen,
            fontSize: 16.0,
          ),
        ),
        series: <ChartSeries>[
          LineSeries<OrdersGraphStatisticsEntity, String>(
            color: AppColors.darkGreen,
            name: '#Orders in 2021',
            markerSettings: const MarkerSettings(isVisible: true),
            dataSource: ordersGraphStatistics,
            xValueMapper: (OrdersGraphStatisticsEntity stat, _) =>
                OrdersGraphViewModel.mapMonthNumToString(stat.month),
            yValueMapper: (OrdersGraphStatisticsEntity stat, _) =>
                stat.numOfOrders,
          ),
        ],
      ),
    );
  }
}


/* 

return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        margin: const EdgeInsets.only(
          right: 18.0,
          left: 12.0,
          top: 24.0,
          bottom: 12.0,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          color: Color(0xff232d37),
        ),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: const Color(0xff37434d), strokeWidth: 1);
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: const Color(0xff37434d), strokeWidth: 1);
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22.0,
                interval: 1.0,
                getTextStyles: (context, value) => const TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return 'JAN';
                    case 2:
                      return 'FEB';
                    case 3:
                      return 'MAR';
                    case 4:
                      return 'APR';
                    case 5:
                      return 'MAY';
                  }
                  return '';
                },
                margin: 8.0,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 5:
                      return '5';
                    case 10:
                      return '10';
                    case 15:
                      return '15';
                    case 20:
                      return '20';
                  }
                  return '';
                },
                reservedSize: 30.0,
                margin: 12.0,
              ),
            ),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(1, 11),
                  FlSpot(2, 10),
                  FlSpot(3, 7),
                  FlSpot(4, 13),
                  FlSpot(5, 8),
                  /* 
                  ordersGraphStatistics
                    .map((stat) => FlSpot(
                          stat.month.toDouble(),
                          stat.numOfOrders.toDouble(),
                        ))
                    .toList()
                     */
                ],
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

*/