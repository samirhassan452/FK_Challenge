import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, CustomTextWidget;
import 'package:flutter/material.dart';

class OrdersHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double height;
  const OrdersHeaderWidget({
    Key? key,
    this.height = kToolbarHeight,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: CustomTextWidget(
        title,
        fontColor: AppColors.white,
        fontSize: 24.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
