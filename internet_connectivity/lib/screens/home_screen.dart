import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

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
    checkRealtimeConnectivity();
  }

  String status = 'Waiting...';
  Connectivity _connectivity = Connectivity();

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
    _connectivity.onConnectivityChanged.listen((event) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Internet Connectivity',
        ),
      ),
      body: Center(
        child: Text(
          status,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // check internet connectivity
          //checkConnetivity();
        },
        tooltip: "Increment",
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
