import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/Result.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerActivity extends StatefulWidget {
  @override
  _ImagePickerActivityState createState() => _ImagePickerActivityState();
}

class _ImagePickerActivityState extends State<ImagePickerActivity> {

  File _imageFile;
  File temp_imageFile;
  final _picker = ImagePicker();
  BuildContext con;

  Future _pickImage(ImageSource source) async{
    PickedFile selected =await _picker.getImage(source: source);
    setState(() {
      _imageFile=File(selected.path);
      if(File(selected.path)!=null){
        showDialogFun();
      }
    });
  }

  Future<void> _cropImage() async{
    File cropped =await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
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
      temp_imageFile = cropped;
      if(cropped!=null){
        Navigator.pop(context,'cropped');
        showDialogFun();
      }
    });
  }

  Future<void> _clear() async{
    setState(() {
      _imageFile=null;
      temp_imageFile=null;
    });
  }

  showDialogFun() async{
    String returnVal = await showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context){
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.yellow[100],
              ),
              // padding: EdgeInsets.all(5.0),
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
                      tag: 'images/gd.jpg',
                      child: Image.file(
                        temp_imageFile==null ? _imageFile:temp_imageFile,
                        // 'images/gd.jpg',
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
                      // fontWeight: FontWeight.bold,
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
                            Text("cancel")
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
                        onPressed: ()=>{
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Result(imageFile: temp_imageFile==null ? _imageFile:temp_imageFile)))
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
        );
      }
    );
    if(returnVal==null){
      // _clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    con=context;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
              child: Hero(
                tag: 'images/gd.jpg',
                child: _imageFile!=null?Image.file(
                  _imageFile,
                  // 'images/gd.jpg',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ):Text('data'),
              ),
            ),
            FlatButton(
              onPressed: ()=>{
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Result(imageFile: _imageFile)))
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
        ),
      ),
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