// import 'package:flutter/material.dart';

// import 'package:redux/redux.dart';
// import 'package:redux_thunk/redux_thunk.dart';
// // import 'package:redux_api_middleware/redux_api_middleware.dart';

// import 'package:flutter_redux/flutter_redux.dart';

// // import 'package:flutter_rest_api/logger.dart';
// import 'package:flutter_rest_api/routes.dart';

// // import 'package:flutter_rest_api/models/app_state2.dart';
// // import 'package:flutter_rest_api/reducers/app_reducer.dart';

// // import 'package:flutter_rest_api/components/user/users_screen.dart';
// // import 'package:flutter_rest_api/components/user/user_details_screen.dart';

// void main() => runApp(App());

// class App extends StatelessWidget {
//   final store = Store<AppState>(
//     appReducer,
//     initialState: AppState.initial(),
//     middleware: [thunkMiddleware, apiMiddleware, loggingMiddleware],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider(
//       store: this.store,
//       child: MaterialApp(
//         title: "Flutter with redux",
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         // routes: {
//         //   AppRoutes.users: (context) => UsersScreen(),
//         //   AppRoutes.userDetails: (context) => UserDetailsScreen(),
//         // },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_rest_api/views/home_page.dart';
// // import 'package:flutter_redux/flutter_redux.dart';
// // import 'package:flutter_rest_api/actions/appstate.dart';
// // import 'package:flutter_rest_api/reducers/appstateReducers.dart';
// // import 'package:flutter_rest_api/views/home_page.dart';
// import 'package:flutter_rest_api/views/login_page.dart';
// // import 'package:redux/redux.dart';
// // import 'package:flutter_rest_api/services/date_time.dart';
// // import 'package:logs/logs.dart';

// // final Log httpLog = Log('http');

// void main() {
//   // httpLog.enabled = true;
//   // final _store = Store(
//   //   reducer,
//   //   initialState: AppState.initialState(),
//   // );

//   // runApp(const MyApp(store: _store));
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // const MyApp({Key? key, required Store<AppState> store, required this.store})
//   //     : super(key: key);
//   // final Store<AppState> store;

//   @override
//   Widget build(BuildContext context) {
//     return
//         // StoreProvider(
//         //   store: store,
//         //   child:
//         MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/login': (context) => const LoginPage(title: 'Login Page'),
//         '/': (context) => const HomePage(title: 'Home Page'),
//         // '/settings': (context) => Settings(),
//       },
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: const LoginPage(title: 'Login Page'),
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_rest_api/views/home_page.dart';
import 'package:flutter_rest_api/views/login_page.dart';
import 'package:redux/redux.dart';

import 'package:flutter_rest_api/reducers/auth_reducer.dart';
import 'package:flutter_rest_api/models/app_state.dart';
import 'package:flutter_rest_api/services/auth_middleware.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   final bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;

//   final store = Store<AppState>(
//     authReducer as Reducer<AppState>,
//     initialState: AppState(isAuthenticated),
//     middleware: [createAuthMiddleware()],
//   );
//   store
//       .dispatch(SaveAuthStateAction(isAuthenticated)); // Dispatch initial state

//   runApp(MyApp(store: store));
// }

void main() {
  final store = Store<AppState>(
    authReducer,
    initialState: AppState.initial(), // Initialize with isAuthenticated: false
    middleware: [createAuthMiddleware()],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: MediaQuery.platformBrightnessOf(context),
      seedColor: Colors.pink.shade50,
    );
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: colorScheme,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorScheme.tertiary,
            foregroundColor: colorScheme.onTertiary,
          ),
        ),
        home: StoreConnector<AppState, bool>(
          converter: (store) => store.state.isAuthenticated,
          builder: (context, isAuthenticated) {
            if (isAuthenticated) {
              // Navigate to HomePage explicitly when isAuthenticated is true
              // WidgetsBinding.instance.addPostFrameCallback((_) {
              //   Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(
              //         builder: (context) => const HomePage(title: 'Homeeeee')),
              //   );
              // });
              // return Container();
              return const HomePage(title: 'Homjkmj');
            } else {
              return const LoginPage(title: 'Login page');
            }
          },
        ),
      ),
    );
  }
}
