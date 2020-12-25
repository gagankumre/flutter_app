import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetectLiveViaCamera extends StatefulWidget {
  @override
  _DetectLiveViaCameraState createState() => _DetectLiveViaCameraState();
}

class _DetectLiveViaCameraState extends State<DetectLiveViaCamera> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.red,
        child: Center(
          child: Text(
            "Start the Camera",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}