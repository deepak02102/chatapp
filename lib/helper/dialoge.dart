 

import 'package:flutter/material.dart';

class Dialoge{
  static void SnackBarPage(BuildContext context , String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.blue,behavior: SnackBarBehavior.floating,),);
  }

  static void showProgressBar(BuildContext context){
    showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator()),);
  }

}