import 'package:flutter/material.dart';
import 'package:flutter_rest_api/views/home_page.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:flutter_rest_api/actions/appstate.dart';
// import 'package:flutter_rest_api/reducers/appstateReducers.dart';
// import 'package:flutter_rest_api/views/home_page.dart';
import 'package:flutter_rest_api/views/login_page.dart';
// import 'package:redux/redux.dart';
// import 'package:flutter_rest_api/services/date_time.dart';
// import 'package:logs/logs.dart';

// final Log httpLog = Log('http');

void main() {
  // httpLog.enabled = true;
  // final _store = Store(
  //   reducer,
  //   initialState: AppState.initialState(),
  // );

  // runApp(const MyApp(store: _store));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // const MyApp({Key? key, required Store<AppState> store, required this.store})
  //     : super(key: key);
  // final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return
        // StoreProvider(
        //   store: store,
        //   child:
        MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(title: 'Login Page'),
        '/': (context) => const HomePage(title: 'Home Page'),
        // '/settings': (context) => Settings(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginPage(title: 'Login Page'),
      // ),
    );
  }
}
