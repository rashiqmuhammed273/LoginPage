// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSCreen extends StatefulWidget {
  LoginSCreen({super.key});

  @override
  State<LoginSCreen> createState() => _LoginSCreenState();
}

class _LoginSCreenState extends State<LoginSCreen> {
  final _usernameController = TextEditingController();

  final _passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Flutter App"),

        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.867),

        //elevation
        shadowColor: Color.fromARGB(255, 255, 0, 0),
        elevation: 220,
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 195, 191, 207),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 350,
            width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'value is empty';
                        } else {
                          return null;
                        }
                      }),
                ),
                const SizedBox(height: 20),

                ///password section starts///
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'password',
                      ),
                      validator: (value) {
                        //  if (value.isEmpty) {
                        //    return 'valuer is Empty'
                        //  }
                        if (value == null || value.isEmpty) {
                          return 'value is empty';
                        } else {
                          return null;
                        }
                      }),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('Data Empty');
                        }
                        // checkLogin(context);
                      },
                      icon: Icon(
                        Icons.check,
                      ),
                      label: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 49, 146, 8),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    //    print(_username);
    final _password = _passwordcontroller.text;
    //     print(_password);

    if (_username == _password) {
      print('ready');
      final _sharedprfrs = await SharedPreferences.getInstance();
      await _sharedprfrs.setBool(SAVE_KEY_NAME, true);

      //here to add sharedprefrnce

      //hello
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => screenhome()));
    } else {
      print(" username or  passowrd not match");
      showDialog(
          context: context,
          builder: (context1) {
            return AlertDialog(
              title: Text(
                'Ooops',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              content: Text('your password is invalid'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context1).pop();
                  },
                  child: Text('close'),
                ),
              ],
            );
          });
      //popup
    }
  }
}
