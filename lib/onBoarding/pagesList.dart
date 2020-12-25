import 'package:flutter/cupertino.dart';
import 'package:flutter_app/util/styles.dart';

List<Widget> getPages(){
  return <Widget>[
    Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'images/onboarding0.png',
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Connect people\naround the world',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
            style: kSubtitleStyle,
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'images/onboarding1.png',
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Live your life smarter\nwith us!',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
            style: kSubtitleStyle,
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'images/onboarding2.png',
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Get a new experience\nof imagination',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
            style: kSubtitleStyle,
          ),
        ],
      ),
    ),
  ];
}