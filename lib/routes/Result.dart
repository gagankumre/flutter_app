import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/util/customAppBar.dart';

class Result extends StatelessWidget {

  final File imageFile;

  Result({@ required this.imageFile});

  @override
  Widget build(BuildContext context) {
    timeDilation=2.0;
    return Scaffold(
      appBar: customAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            // SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Hero(
                    tag: 'images/gd.jpg',
                    child: Image.file(
                      imageFile,
                      width: MediaQuery.of(context).size.width*0.95,
                      height: MediaQuery.of(context).size.height*0.85,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

