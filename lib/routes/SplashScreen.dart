import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> {

  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

  FadeIn() {
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
    });
  }

  @override
  void setState(fn) {
    super.setState(fn);
    Timer(Duration(seconds: 1),(){
      Navigator.of(context).pushReplacement(
        new PageRouteBuilder(
          opaque: false,
          transitionDuration: Duration(milliseconds: 1500),
          barrierDismissible:true,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return Home();
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
              child: child,
            );
          },
        )
      );
    });
  }

  @override Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Hero(
              tag: 'title',
              child: new FlutterLogo(
                size: 200.0, style: _logoStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}