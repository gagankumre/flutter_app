import 'package:flutter/material.dart';
import 'package:flutter_app/routes/Home.dart';
import 'package:flutter_app/routes/Result.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    routes: {
      '/Result': (context) => Result(),
    },
  ));
}