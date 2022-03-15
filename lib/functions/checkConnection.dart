import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

checkConnection(
    StreamSubscription<ConnectivityResult>? connectivitySubscription,
    Connectivity _connectivity,
    future,
    bool isConnected,
    VoidCallback func) {
  connectivitySubscription =
      _connectivity.onConnectivityChanged.listen((event) {
    if (event == ConnectivityResult.wifi ||
        event == ConnectivityResult.mobile) {
      future;
      isConnected = true;
      func;
    } else {
      isConnected = false;
      func;
    }
  });
}
