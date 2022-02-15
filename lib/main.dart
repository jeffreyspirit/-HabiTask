// Import Packages
import 'dart:async';
import 'Onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Define Class A - Stateless
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: MyHomePage(),
    );
  }
}

// Define Class B - Stateful
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Define Class C - Widget
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/image/Habitasks.png'),
            )
          ),
        ),
      ),
    );
  }
  void openOnBoard()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding()));
  }
}

