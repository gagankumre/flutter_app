import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/customAppBar.dart';

class Result extends StatefulWidget {

  final File imageFile;
  Result({@ required this.imageFile});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    // timeDilation =1.3;
    return Scaffold(
      appBar: customAppBar(),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            SizedBox(height: MediaQuery.of(context).size.width*.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Hero(
                    tag: 'image-file',
                    child: Image.file(
                      widget.imageFile,
                      width: MediaQuery.of(context).size.width*.95,
                      height: MediaQuery.of(context).size.width*.95,
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

