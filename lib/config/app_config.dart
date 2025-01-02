import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/sp_util.dart';
 import 'package:provider/provider.dart';

class AppConfig {
  static initApp() async {
    Provider.debugCheckInvalidValueType = null; //Provider state manage async
    WidgetsFlutterBinding.ensureInitialized(); //WidgetsFlutterBinding init and func config
    await initSp();
   }

  /// initSp
  static Future<void> initSp() async => await SpUtil.getInstance();


}
