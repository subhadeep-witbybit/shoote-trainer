import 'package:flutter/material.dart';
import 'package:shooter_demo/screens/schools_list.dart';

void main() {
  runApp(const ShooterApp());
}

class ShooterApp extends StatelessWidget {
  const ShooterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shooter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: Shooter,
    );
  }
}
