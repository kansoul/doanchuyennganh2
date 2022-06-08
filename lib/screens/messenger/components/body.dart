import 'package:chatapp/constants.dart';
import 'package:chatapp/models/ChatMessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chats_input_field.dart';
import 'message.dart';

ScrollController scrollController = ScrollController();

class Body extends StatelessWidget {
  final String email;
  final String fullname;
  final String img;
  final String uid;

  const Body(
      {Key? key,
      required this.email,
      required this.fullname,
      required this.img,
      required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Messenger")
                .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                //data0->messenger
                Map<String, dynamic> data0 =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: data0[uid].length,
                        itemBuilder: (context, index) => Messenger(
                              message: data0[uid][index]['messenger'],
                              send: data0[uid][index]['send'],
                              img: data0[uid][index]['img'],
                              text: data0[uid][index]['text'],
                            )),
                  ),
                );
              } else
                return Text("éo có tin nhắn");
            }),
        ChatsInputField(email: email, fullname: fullname, img: img, uid: uid),
      ],
    );
  }
}
