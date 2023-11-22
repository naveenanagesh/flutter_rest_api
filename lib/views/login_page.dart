// import 'dart:ffi';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/login.dart';
import 'package:flutter_rest_api/services/login.dart';
import 'package:flutter_rest_api/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<Login>? loginData;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  void login(String email, String password) async {
    await LoginService.login(email, password).then((result) => {
          setState(() {
            loginData = Future.value(result);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (loginData == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Form buildColumn() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login(emailController.text, passwordController.text);
                      // setState(() {
                      //   loginData =  login(
                      //       emailController.text, passwordController.text
                      //   );
                      // });

                      // setState(() {
                      //   loginData =
                      // });
                      // datat1 = LoginService.login(
                      //     emailController.text, passwordController.text);
                      // data = datat1
                      //     ?.map<Login>((json) => Login.fromJson(json))
                      //     .toList();

                      // if (emailController.text == "naveena@gmail.com" &&
                      //     passwordController.text == "1234") {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => HomePage(
                      //               title: 'Home Page',
                      //               email: emailController.text,
                      //             )),
                      //   );
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         content: Text('Invalid Credentials')),
                      //   );
                      // }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill input')),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<Login> buildFutureBuilder() {
    return FutureBuilder<Login>(
      future: loginData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('naveeeeeanananananan');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage(title: 'Home Page')),
          );
          // return const newWidget();
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

// class newWidget extends StatelessWidget {
//   const newWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return const HomePage(
//       title: 'Home Page',
//     );
//   }
// }
