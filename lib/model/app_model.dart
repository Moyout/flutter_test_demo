import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


class AppModel {
  List<ConnectivityResult> _connectivityResult = [];
  ConnectivityResult _netMode = ConnectivityResult.wifi;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  AppModel() {
    listenInNet();
  }

  appInit() {}

  void listenInNet() async {
    _connectivityResult = await (Connectivity().checkConnectivity());
    _subscription ??= Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.mobile)) {
        _netMode = ConnectivityResult.mobile;
      } else if (result.contains(ConnectivityResult.wifi)) {
        _netMode = ConnectivityResult.wifi;
      } else if (result.contains(ConnectivityResult.ethernet)) {
      } else if (result.contains(ConnectivityResult.vpn)) {
      } else if (result.contains(ConnectivityResult.bluetooth)) {
      } else if (result.contains(ConnectivityResult.other)) {
      } else if (result.contains(ConnectivityResult.none)) {
        _netMode = ConnectivityResult.none;
      }
      _connectivityResult = result;
    });
  }

  ConnectivityResult get networkMode => _netMode;

  bool get noNetwork => _netMode == ConnectivityResult.none;
}
