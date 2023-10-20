import 'package:flutter/material.dart';
// import 'package:flutter_rest_api/views/home_page.dart';
import 'package:flutter_rest_api/views/login_page.dart';
// import 'package:logs/logs.dart';

// final Log httpLog = Log('http');

void main() {
  // httpLog.enabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Login Page'),
    );
  }
}
