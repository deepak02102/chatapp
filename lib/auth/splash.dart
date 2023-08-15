import 'dart:developer';

import 'package:chatapp/api/apis.dart';
import 'package:chatapp/auth/login_screen.dart';
import 'package:chatapp/constant/appsize.dart';
import 'package:chatapp/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreen> {
   
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1500),() {

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if(Apis.auth.currentUser != null){
         log('\nUser : ${Apis.auth.currentUser}');
   
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }else{
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      }

      
    
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: Appsize.getheight(context) * .15,
                width: Appsize.getwidth(context) * .5,
                right: Appsize.getwidth(context)*.25,
                
                child: Image.asset('assets/images/icon.png')),

                Positioned(
                bottom: Appsize.getheight(context) * .15,
                width: Appsize.getwidth(context) * .90,
                height: Appsize.getheight(context)* .07,
                left: Appsize.getwidth(context) * .05,
                child: Text("Made In India Chat App", textAlign: TextAlign.center, style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.w500),) ),
          ],
        ));
  }
}
