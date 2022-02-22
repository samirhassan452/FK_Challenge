import 'package:flapkap_challenge/app/features/bottom_navigation/bottom_navigation_exports.dart'
    show BottomNavigationModel;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, CustomTextWidget, CustomVerticalSpace;
import 'package:flutter/material.dart';

class BottomNavigationBarCardWidget extends StatelessWidget {
  final BottomNavigationModel _bottomNavigationModel;
  final double _cardWidth;
  final int _currentItemId;
  final void Function(int) _onPickItem;
  const BottomNavigationBarCardWidget({
    Key? key,
    required BottomNavigationModel bottomNavigationModel,
    required double cardHeight,
    required int currentItemId,
    required void Function(int) onPickItem,
  })  : _bottomNavigationModel = bottomNavigationModel,
        _cardWidth = cardHeight,
        _currentItemId = currentItemId,
        _onPickItem = onPickItem,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onPickItem(_bottomNavigationModel.id - 1),
      child: SizedBox(
        width: _cardWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // icon
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: Image.asset(
                _bottomNavigationModel.icon,
                width: 30.0,
                height: 30.0,
                color: _currentItemId == _bottomNavigationModel.id
                    ? AppColors.darkTurquoise
                    : AppColors.black3,
              ),
            ),
            /* CustomSvgIconWidget(
              item.icon!,
              iconWidth: 30,
              iconHeight: 30,
              iconColor: item.id == _bottomNavigationModel.id
                  ? _bottomNavigationModel.activeIconColor
                  : _bottomNavigationModel.unactiveIconColor,
            ), */
            const CustomVerticalSpace(height: 7.0),
            // label
            CustomTextWidget(
              _bottomNavigationModel.label,
              fontColor: _currentItemId == _bottomNavigationModel.id
                  ? AppColors.darkTurquoise
                  : AppColors.black3,
              fontSize: 12.5,
            ),
            const CustomVerticalSpace(height: 7.0),
            // line
            Container(
              height: 2.5,
              width: 5.5,
              color: _currentItemId == _bottomNavigationModel.id
                  ? AppColors.darkGreen
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
