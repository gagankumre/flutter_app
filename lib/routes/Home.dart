import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter_app/container/imagePickerActivity.dart';
import 'package:flutter_app/container/openCamera.dart';
import 'package:flutter_app/util/customAppBar.dart';
import 'package:flutter_app/util/myDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedPos = 0;
  double bottomNavBarHeight = 65.0;
  CircularBottomNavigationController _navigationController;
  ImagePickerActivity imagePicker=new ImagePickerActivity();

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.image_search_outlined, "Detect via Image", Colors.cyan, labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(Icons.camera_alt_outlined, "Detect Live via Camera", Colors.red, labelStyle: TextStyle(fontWeight: FontWeight.bold)),
  ]);

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: <Widget>[
          Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {

    if(selectedPos==0){
      return imagePicker;
    }else{
      return openCamera();
    }
    /*
    Color selectedColor = tabItems[selectedPos].circleColor;
    String slogan;

    switch (selectedPos) {
      case 0:
        slogan = "Pick an image";
        break;
      case 1:
        slogan = "Start the camera";
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        // color: selectedColor,
        child: Center(
          child: Text(
            slogan,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),

      // onTap: () {
      //   if (_navigationController.value == tabItems.length - 1) {
      //     _navigationController.value = 0;
      //   } else {
      //     _navigationController.value++;
      //   }
      // },
    );
    */
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.orange,
      normalIconColor: Colors.grey[100],
      selectedIconColor: Colors.black,
      circleStrokeWidth: 5.0,
      animationDuration: Duration(milliseconds: 500),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

}
