import 'dart:developer';
import 'dart:io';

import 'package:chatapp/constant/appsize.dart';
import 'package:chatapp/helper/dialoge.dart';
import 'package:chatapp/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomePageState();
}

class _HomePageState extends State<LoginScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _handleGoogleBtnClick() {
    Dialoge.showProgressBar(context);
    _signInWithGoogle().then((user) => {
      Navigator.pop(context),
      if(user != null){
        log('\nUser : ${user .user}'),
      log('\nUserAdditionalInfo : ${user.additionalUserInfo}'),
      Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ))
      },
          
        });
  }

  Future<UserCredential?> _signInWithGoogle() async {
   try {
    await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
   } catch (e) {

     log('_signInWithGoogle $e');
     Dialoge.SnackBarPage(context, 'Somthing Went Wrong ( Check Interent )');
      return null;
   }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "welcome to Chat app",
          ),
        ),
         
        body: Stack(
          children: [
            AnimatedPositioned(
                top: Appsize.getheight(context) * .15,
                width: Appsize.getwidth(context) * .50,
                right: _isAnimate
                    ? Appsize.getwidth(context) * .25
                    : -Appsize.getwidth(context) * .5,
                duration: Duration(seconds: 1),
                child: Image.asset('assets/images/icon.png')),
            Positioned(
                bottom: Appsize.getheight(context) * .15,
                width: Appsize.getwidth(context) * .90,
                height: Appsize.getheight(context) * .07,
                left: Appsize.getwidth(context) * .05,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 223, 255, 187),
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {

                      _handleGoogleBtnClick();
                    },
                    icon: Image.asset(
                      'assets/images/google.png',
                      height: Appsize.getheight(context) * .04,
                    ),
                    label: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Login with ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Google",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black))
                    ])))),
          ],
        ));
  }
}
