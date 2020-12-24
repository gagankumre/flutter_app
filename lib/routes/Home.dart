import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter_app/container/detectViaImage.dart';
import 'package:flutter_app/container/detectLiveViaCamera.dart';
import 'package:flutter_app/util/customAppBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedPos = 0;
  double bottomNavBarHeight = 65.0;
  CircularBottomNavigationController _navigationController;
  DetectViaImage imagePicker=new DetectViaImage();

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
