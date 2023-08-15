import 'package:chatapp/constant/appsize.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: Appsize.getwidth(context)*.04, vertical: 4),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
       child: InkWell(
        onTap: () {
          
        },
         child: ListTile(
             leading: CircleAvatar(backgroundColor: Colors.transparent, child: Center(child: Image.asset("assets/images/Avatar.png", )),),
             title:  Text("Deepak Kumar"),
             subtitle: Text("Last User Message", maxLines: 1,),
             trailing: Text('12:00 pm'),
           ),
       ),);
  }
}