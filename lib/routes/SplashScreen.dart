import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/Home.dart';
import 'package:flutter_app/util/SlideFadeTransition.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> {

  Text _text;

  FadeIn() {
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        // _text=Text("Saviour",style: TextStyle(fontSize: 40,color: Colors.grey[700]),);
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
          // child: Container(
          //   child: new FlutterLogo(
          //     size: 200.0, style: _logoStyle,
          //   ),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/saviour_logo.png"),
              SlideFadeTransition(child: Text("Saviour",style: TextStyle(fontSize: 50,color: Colors.grey[800]),),offset: -2,)
              // _text!=null?SlideFadeTransition(
              //   child: _text,
              //   offset: 0.5,
              // )
              //     :Text(""),
            ],
          ),
        ),
      ),
    );
  }
}