import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/Result.dart';
import 'package:image_cropper/image_cropper.dart';

class CustomDialog extends StatefulWidget {

  final File imageFile;
  CustomDialog({@required this.imageFile});

  @override
  _CustomDialogState createState() => _CustomDialogState(imageFile: imageFile);
}

class _CustomDialogState extends State<CustomDialog> {

  final File imageFile;
  _CustomDialogState({this.imageFile});
  File tempImageFile;

  Future<void> _cropImage() async{
    File cropped =await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        /*// CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9*/
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.orange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true,
      ),
    );
    setState(() {
      tempImageFile = cropped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xA0000000),
      body: Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.yellow[100],
            ),
            width: 360.0,
            height: 500.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                  child: Hero(
                    tag: 'image-file',
                    child: Image.file(
                      tempImageFile==null ? imageFile:tempImageFile,
                      width: 360,
                      height: 360,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Selected Sample',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    FlatButton(
                      onPressed: ()=>Navigator.pop(context),
                      color: Colors.red,
                      minWidth: 100.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.cancel_outlined),
                          SizedBox(height: 4.0,),
                          Text("Cancel")
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: _cropImage,
                      color: Colors.blue,
                      minWidth: 100.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.crop),
                          SizedBox(height: 4.0,),
                          Text("Adjust")
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: ()async=>{
                        await Navigator.of(context).push(
                          new PageRouteBuilder(
                            opaque: false,
                            transitionDuration: Duration(milliseconds: 500),
                            barrierDismissible:true,
                            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                              return Result(imageFile: tempImageFile==null ? imageFile:tempImageFile);
                            },
                            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                              return FadeTransition(
                                opacity: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                                child: child,
                              );
                            },
                          )
                        ),
                        Navigator.pop(context),
                      },
                      color: Colors.green,
                      minWidth: 100.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.arrow_forward),
                          SizedBox(height: 4.0,),
                          Text("Confirm")
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
