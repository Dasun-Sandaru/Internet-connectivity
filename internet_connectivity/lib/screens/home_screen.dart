import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState 
    super.initState();

    // call checkConnetivity method
    //checkConnetivity();

    // call check realtime connectivity method
    //checkRealtimeConnectivity();

    // call ckeck internet active
    _streamSubscriptionInternetActivite = InternetConnectionChecker().onStatusChange.listen((event) {
      final activeInternet = event == InternetConnectionStatus.connected;

      setState(() {
        this.activeInternet = activeInternet;
        text = activeInternet ? 'Online' : 'Offline';
      });
    });
  }

  String status = 'Waiting...';
  String text = 'On';
  bool activeInternet = false;

  TextEditingController _internetActive = TextEditingController();

  final Connectivity _connectivity = Connectivity();
  // internet connectivity
  late StreamSubscription _streamSubscriptionInvernetConnectivity;
  // internet avative
  late StreamSubscription _streamSubscriptionInternetActivite;


  // methods

  // check internet connetivity
  Future<void> checkConnetivity() async {
    var connectionResult = await _connectivity.checkConnectivity();

    if (connectionResult == ConnectivityResult.mobile) {
      status = 'Mobile Data';
      print('Mobile Data');
    } else if (connectionResult == ConnectivityResult.wifi) {
      status = 'Wifi';
      print('Wifi');
    } else {
      status = 'Not Connected';
      print('Not Connected');
    }

    setState(() {
      //
    });
  }

  // check real time internet connectivity
  void checkRealtimeConnectivity() {
    _streamSubscriptionInvernetConnectivity = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        status = 'Mobile Data';
        print('Mobile Data');
        setState(() {
          
        });
      } else if (event == ConnectivityResult.wifi) {
        status = 'Wifi';
        print('Wifi');
        setState(() {
          
        });
      } else {
        status = 'Not Connected';
        print('Not Coonected');
        setState(() {
          
        });
      }
    });

    setState(() {
      //
    });
  }

  // check active internet connection
  // Future<void> checkActiveConnection() async {
  //   activeInternet = await InternetConnectionChecker().hasConnection;


    
  //   // final toastColor = activeInternet ? Colors.green[300]: Colors.red[400];

  //   // // show over layer toast
  //   // showSimpleNotification(
  //   //   Text(
  //   //     '$text',
  //   //     style: const TextStyle(
  //   //       color: Colors.white,
  //   //       fontSize: 20,
  //   //     ),
  //   //   ),
  //   //   background: toastColor,
  //   // );

  //   setState(() {
  //     text = activeInternet ? 'Online' : 'Offline';
  //   });

  // }


  @override
  void dispose() {
    // TODO: implement dispose

    // close stream Subscription
    _streamSubscriptionInvernetConnectivity.cancel();
    _streamSubscriptionInternetActivite.cancel();
    super.dispose();

    

  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Internet Connectivity',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // internet sourse ?
              Text(
                status,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              // internet activite ?
              Text(
                'Yor are $text',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // check internet connectivity
            //checkConnetivity();
    
            // check active internet connection
            //checkActiveConnection();
          },
          tooltip: "Increment",
          child: const Icon(Icons.question_mark),
        ),
      ),
    );
  }
}
