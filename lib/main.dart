import 'package:allnewz/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: AllNewz(),
    );
  }
}

class AllNewz extends StatefulWidget {
  @override
  _AllNewzState createState() => _AllNewzState();
}

class _AllNewzState extends State<AllNewz> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Home()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "::::::::::::::::::::::::::::::\n ##*All Knewz*##\n::::::::::::::::::::::::::::::::",
            style: TextStyle(
                fontSize: 38, color: Colors.blue, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
