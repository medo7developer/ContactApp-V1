import 'package:contactapp/home.dart';
import 'package:flutter/material.dart';

import 'container_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2195F1),
          centerTitle: true,
          title: Text(
            'Contacts Screen',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: MyHomePage(),
      ),
    );
  }
}
