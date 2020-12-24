import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/CustomDialog.dart';
import 'package:image_picker/image_picker.dart';

class DetectViaImage extends StatefulWidget {
  @override
  _DetectViaImageState createState() => _DetectViaImageState();
}

class _DetectViaImageState extends State<DetectViaImage> {

  File _imageFile;
  final _picker = ImagePicker();

  Future _pickImage(ImageSource source) async{
    PickedFile selected =await _picker.getImage(source: source);
    setState(() {
      _imageFile=File(selected.path);
      if(File(selected.path)!=null){
        Navigator.of(context).push(
          new PageRouteBuilder(
            opaque: false,
            transitionDuration: Duration(milliseconds: 500),
            barrierDismissible:true,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return CustomDialog(imageFile: _imageFile);
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              return FadeTransition(
                opacity: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: child,
              );
            },
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed:()=> _pickImage(ImageSource.camera),
            child: Icon(Icons.camera_alt_outlined,size: 40.0,color: Colors.black,),
            heroTag: 1,
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed:()=> _pickImage(ImageSource.gallery),
            child: Icon(Icons.photo_library_outlined,size: 40.0,color: Colors.black,),
            heroTag: 2,
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}