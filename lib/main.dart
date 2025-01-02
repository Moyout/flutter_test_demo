import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/app_config.dart';
import 'package:flutter_demo/config/provider/provider_ctrl.dart';
import 'package:flutter_demo/utils/app_util.dart';
import 'package:flutter_demo/view/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await AppConfig.initApp();

  runApp(
    MultiProvider(providers: ProviderCtrl.providers, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      navigatorKey: AppUtils.navigatorKey,
      home: const HomePage(),
    );
  }
}
