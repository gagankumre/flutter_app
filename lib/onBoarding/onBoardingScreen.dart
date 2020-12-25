import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/onBoarding/pagesList.dart';
import 'package:flutter_app/util/gradientBoxDecoration.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: 10.0,
      width: isActive ? 26.0 : 18.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 2.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: gradientBoxDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Container(
                //   child: Align(
                //     alignment: FractionalOffset.topRight,
                //     child: FlatButton(
                //       onPressed: () {
                //         _currentPage != _numPages - 1
                //             ? _pageController.nextPage(
                //           duration: Duration(milliseconds: 500),
                //           curve: Curves.ease,
                //         )
                //             : _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                //       },
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         mainAxisSize: MainAxisSize.min,
                //         children: <Widget>[
                //           Text(
                //             'Next',
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 22.0,
                //             ),
                //           ),
                //           SizedBox(width: 10.0),
                //           Icon(
                //             Icons.arrow_forward,
                //             color: Colors.black,
                //             size: 30.0,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: getPages(),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
