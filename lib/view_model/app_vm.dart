import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/model/app_model.dart';

class AppViewModel extends ChangeNotifier {
  final AppModel model;

  AppViewModel({required this.model});

  ConnectivityResult get netMode => model.networkMode;
}
