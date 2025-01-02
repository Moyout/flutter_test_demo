import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppUtils {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static BuildContext get context => getContext();

  // global context
  static BuildContext getContext() {
    return AppUtils.navigatorKey.currentState!.overlay!.context;
  }

  //close key
  // static void turnOffKeyBoard() {
  //   FocusScope.of(getContext()).requestFocus(FocusNode());
  // }

  //screen width
  static double getWidth(BuildContext context) {
    return MediaQueryData.fromView(View.of(context)).size.width;
  }

  //screen Height
  static double getHeight(BuildContext context) {
    return MediaQueryData.fromView(View.of(context)).size.height;
  }

  static MediaQueryData currViewData(BuildContext context) {
    return MediaQueryData.fromView(View.of(context));
  }
}
