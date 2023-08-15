 
import 'package:chatapp/auth/splash.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

// Platform  Firebase App Id
// android   1:773733453612:android:bd41f00c05d2703dc12689
// ios       1:773733453612:ios:17233c3b4b73290ac12689

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 1, centerTitle:true, backgroundColor: Colors.white, titleTextStyle: TextStyle(color: Colors.black), ),
      ),
      home: SplashScreen(),
    );
  }
}

_initializeFirebase()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
}