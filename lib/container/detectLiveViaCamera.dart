import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget openCamera(){
  return GestureDetector(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      // color: selectedColor,
      child: Center(
        child: Text(
          "Start the Camera",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ),
  );
}