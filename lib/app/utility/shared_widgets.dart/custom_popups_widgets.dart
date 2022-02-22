import 'package:flutter/material.dart';
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show CustomAlertDialogWidget, NavigationService, POP_UP_MESSAGE_TYPE;

class CustomPopUpsWidgets {
  static Future<bool> showCloseAppMessageDialog({
    String? primaryText,
    VoidCallback? primaryAction,
    String? secondaryText,
    VoidCallback? secondaryAction,
  }) async {
    final context = NavigationService.navigatorKey.currentContext!;
    return (await showGeneralDialog<bool>(
          barrierColor: Colors.black.withOpacity(0.6),
          transitionBuilder: (context, a1, a2, widget) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: CustomAlertDialogWidget(
                    titleMessageType: POP_UP_MESSAGE_TYPE.confirm,
                    contentText: "Do you want to exit an App?",
                    primaryBtnPressed:
                        primaryAction ?? () => Navigator.of(context).pop(true),
                    primaryBtnText: primaryText ?? "Yes",
                    secondaryBtnPressed: secondaryAction ??
                        () => Navigator.of(context).pop(false),
                    secondaryBtnText: secondaryText ?? "No",
                  ),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
          barrierDismissible: false,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return const SizedBox();
          },
        )) ??
        false;
  }

  static Future<bool> showWarningMessageDialog(
    String warningText,
  ) async {
    final context = NavigationService.navigatorKey.currentContext!;
    return (await showGeneralDialog<bool>(
          barrierColor: Colors.black.withOpacity(0.6),
          transitionBuilder: (context, a1, a2, widget) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: CustomAlertDialogWidget(
                    titleMessageType: POP_UP_MESSAGE_TYPE.warning,
                    contentText: warningText,
                  ),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
          barrierDismissible: false,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return const SizedBox();
          },
        )) ??
        false;
  }
}
