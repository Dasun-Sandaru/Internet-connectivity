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
    checkConnetivity();
  }

  String status = 'Waiting...';
  Connectivity _connectivity = Connectivity();

  

  // methods

  // check internet connetivity
  Future<void> checkConnetivity() async {
    var connectionResult = await _connectivity.checkConnectivity();

    if (connectionResult == ConnectivityResult.mobile) {
      status = 'Mobile Data';
    } else if (connectionResult == ConnectivityResult.wifi) {
      status = 'Wifi';
    } else {
      status = 'Not Connected';
    }

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
          checkConnetivity();
        },
        tooltip: "Increment",
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
