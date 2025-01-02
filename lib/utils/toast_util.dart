import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToastUtil {
  ///loading
  static CancelFunc showLoadingToast({int seconds = 1, bool clickClose = true}) {
    return BotToast.showLoading(
      duration: Duration(seconds: seconds),
      clickClose: clickClose,
      crossPage: false,
      backButtonBehavior: BackButtonBehavior.ignore, //can't back
    );
  }

  ///Custom
  static showCustomLoadingToast({int seconds = 1, bool clickClose = true}) {
    return BotToast.showCustomLoading(
      toastBuilder: (CancelFunc cancelFunc) {
        return Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const CupertinoActivityIndicator(color: Colors.white),
        );
      },
      duration: Duration(seconds: seconds),
    );
  }

  ///通知toast
  static showBotToast(String? text, {int seconds = 3, Color? textColor, Color? bgColor}) {
    if (text == null) return;
    return BotToast.showSimpleNotification(
      title: text,
      hideCloseButton: true,
      backgroundColor: bgColor,
      duration: Duration(seconds: seconds),
    );
  }

  ///bottom toast
  static showBottomToast(String? text, {int seconds = 3}) {
    if (text == null) return;
    return BotToast.showText(
      text: text,
      duration: Duration(seconds: seconds),
    );
  }

  static closeLoading() {
    return BotToast.closeAllLoading();
  }
}
