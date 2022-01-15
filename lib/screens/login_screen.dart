import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("مسا مسا يا رؤوف", textScaleFactor: 1.0,style: TextStyle(fontSize: 20),)
      ),
    );
  }
}
