import 'dart:developer';

import 'package:chatapp/api/apis.dart';
import 'package:chatapp/auth/login_screen.dart';
import 'package:chatapp/helper/dialoge.dart';
import 'package:chatapp/widget/chat_user_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
   final dtgd = Apis.fireStore.collection('users');

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            CupertinoIcons.home,
          ),
          title: const Text(
            "Chat app",
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
            Dialoge.showProgressBar(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
          child: Icon(Icons.add_comment_rounded),
        ),
        body: StreamBuilder(
          stream: Apis.fireStore.collection('users').snapshots(),
          builder: (context, snapshot) {
            final List list = [];

            if (snapshot.hasData == null) {
             print("Data null"); 
            }
            if(snapshot.hasData) {
              final data = snapshot.data?.docs;
              for (var i in data!) {
                log("Data  ${i.data()}");
                list.add(i.data()['name']);                
              }
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                // return ChatUserCard();
                return TextButton( onPressed: () {print(list);}, child: Text("Deepak"));
              },
            );
          },
        ));
  }
}
