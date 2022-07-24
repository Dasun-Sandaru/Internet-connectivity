import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late StreamSubscription _streamSubscriptionInternetActivite;
  String status = 'Waiting...';
  String text = 'On';
  bool activeInternet = false;

  @override
  void initState() {
    // call ckeck internet active
    checkActiveConnection();
    super.initState();
  }

  checkActiveConnection(){
    // call ckeck internet active
    _streamSubscriptionInternetActivite = InternetConnectionChecker().onStatusChange.listen((event) {
      final activeInternet = event == InternetConnectionStatus.connected;

      setState(() {
        this.activeInternet = activeInternet;
        text = activeInternet ? 'Online' : 'Offline';
      });
    });
  }

  @override
  void dispose() {
    _streamSubscriptionInternetActivite.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Internet Connectivity Screen 2',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
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

          if (activeInternet) {
            print('Data submited');
          } else {
            print('Data Not Sumbit');
          }

          // check active internet connection
          //checkActiveConnection();
        },
        tooltip: "Increment",
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
