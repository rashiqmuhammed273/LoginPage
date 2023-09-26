// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class screenhome extends StatelessWidget {
  const screenhome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 152, 186),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 244, 9),
        title: Text('Home'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(//pop because it goes back to the previous page
              context,
              MaterialPageRoute(
                builder: (context) =>LoginSCreen(),
                // Fixed the typo here
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body:
      
       ListView.builder(
        
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                SizedBox(
                  width: 21,
                ),
                Text('Item $index'),
              ],
              
            ),
          ); // Return a ListTile or another widget here
        },
      ),
    );
  }
}