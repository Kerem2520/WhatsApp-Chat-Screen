import 'package:flutter/material.dart';
import 'package:pdk/kaynak.dart';
import 'sohbetPdk.dart'; 

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: ChatScreen(messages1), 
    );
  }
}