import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

  const SAVE_KEY_NAME ='userloggedin';

void main(){
  SharedPreferences.getInstance();
  runApp(Loginsample());
}

class Loginsample extends StatefulWidget {
  const Loginsample({super.key});

  @override
  State<Loginsample> createState() => _LoginsampleState();
}

class _LoginsampleState extends State<Loginsample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      home: screensplash(),
      debugShowCheckedModeBanner: false,
    );
  }

} 