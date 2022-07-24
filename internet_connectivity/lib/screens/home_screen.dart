import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String status = 'Waiting...';

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
        onPressed: (){
          // check internet connectivity
        },
        tooltip: "Increment",
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}