import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckInternetConnection{

  String status = 'Waiting...';
  bool isAvailable = false;

  late StreamSubscription _streamSubscriptionInternetActivite;


  checkInternetConnection(){
    _streamSubscriptionInternetActivite = InternetConnectionChecker().onStatusChange.listen((event) {
      final isAvailable = event == InternetConnectionStatus.connected;
      status = isAvailable ? 'Online' : 'Offline';
    });

    return status;
  }

  
}