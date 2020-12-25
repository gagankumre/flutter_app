import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration gradientBoxDecoration(){
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.3, 0.5, 0.6,0.7,0.9],
      colors: [
        Colors.cyan[50],
        Colors.cyan[100],
        Colors.cyan[200],
        Colors.cyan[300],
        Colors.cyan[400],
        Colors.cyan,
      ],
    ),
  );
}