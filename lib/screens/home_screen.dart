import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text("Home Screen", textScaleFactor: 1.0,style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
