import 'package:flutter/material.dart';

class Appsize{

  static double getwidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getheight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

}