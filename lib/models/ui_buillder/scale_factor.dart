// this class will determine the screen size and provide the custom scale
// values for all UI components to avoid bleeding or stretch

import 'package:flutter/cupertino.dart';

class ScaleFactor {

  // get screen width of the current device using this method
  double getScreenWidth(BuildContext context){
    Size size = MediaQuery.sizeOf(context);
    return size.width;
  }

  // determine the text scale factor
  double getTextScaleFactor(BuildContext context){
    double width = getScreenWidth(context);
    // implement your logic to scale text according to the UI width
    double textScale = 0.0;

    return textScale;
  }

  /*
  TEXT SCALE FACTORS FOR FOLLOWING PAGES:
  - HOME
  heading = 24
  context = 16

  - ABOUT
  heading = 30
  title = 20
  description = 10

  - 
   */
}