import 'dart:async';

import 'package:flutter/material.dart';
import 'package:profilebabavendor/ui/Screens/Login.dart';
import 'package:profilebabavendor/ui/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => {checkFirstSeen()});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset('assets/images/logo.png')));
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    SharedPreferences prefsr = await SharedPreferences.getInstance();
    String bb;

    setState(() {
      bb = prefsr.getString('login');
      print(bb);
    });

    if (_seen) {
      // if (bb == "true") {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginPage()));
      // } else {
      //   Navigator.of(context).pushReplacement(
      //       new MaterialPageRoute(builder: (context) => new IntroPage()));
      // }
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginPage()));
    }
  }
}
