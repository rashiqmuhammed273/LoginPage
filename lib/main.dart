import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/welcome.dart';



void main(){

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
      home: screenwelcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}