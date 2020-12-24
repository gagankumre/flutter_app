/*
*  just for testing
* */
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/Result.dart';

class TestDialogRoute extends StatefulWidget {
  final File imageFile;
  TestDialogRoute({this.imageFile});
  @override
  _TestDialogRouteState createState() => _TestDialogRouteState(imageFile: imageFile);
}

class _TestDialogRouteState extends State<TestDialogRoute> {

  final File imageFile;
  _TestDialogRouteState({this.imageFile});
  BuildContext con;
  @override
  Widget build(BuildContext context) {
    con=context;
    return Scaffold(
      backgroundColor: Color(0x66000000),//40% transparent black
      body: Center(
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
                    tag: 'image-file',
                    child: Image.file(
                      imageFile,
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
                          Text("Cancel")
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: (){},
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
                              // fullscreenDialog: true,
                              transitionDuration: Duration(milliseconds: 500),
                              barrierDismissible:true,
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return Result(imageFile:imageFile);
                              },
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return FadeTransition(
                                  opacity: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                                  child: child,
                                );
                              },
                            )
                        ),
                        Navigator.pop(context),
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Result(imageFile: temp_imageFile==null ? _imageFile:temp_imageFile)))
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
