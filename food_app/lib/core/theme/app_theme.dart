import 'package:flutter/material.dart';

class MyAppColor{

  static Color primaryColor = Color(0xff7e370c);
  static Color titleBlackText = Color(0xff242424);
  static Color subTitleText = Color(0xffA2A2A2);
  static Color iconBlack = Color(0xff1d1b19);
  static Color dividerColor = Color(0xffffce45);
}



class MyTextStyle{
  static TextStyle normalTitleText({ Color? color, double? size}){
    return TextStyle(
      fontSize: size?? 16,
      color: color?? MyAppColor.titleBlackText,
      fontWeight: FontWeight.bold,

    );
  }

  static TextStyle smallTitleText({Color? color, double? size}){
    return TextStyle(
      fontSize: size?? 16,
      color : color?? MyAppColor.titleBlackText,
       fontWeight: FontWeight.bold
    );
  }

  static TextStyle  subTitleText({Color? color, double? size}){
    return TextStyle(
      fontSize: size?? 12,
      color:  MyAppColor.subTitleText,
      
    );
  }
}