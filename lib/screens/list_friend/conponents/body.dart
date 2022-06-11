import 'package:chatapp/components/addfriend_text.dart';
import 'package:chatapp/models/Chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../add_friend/add_friend.dart';
import '../../messenger/messenger_screen.dart';
import 'friend_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Friend")
            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data1 =
                snapshot.data!.data() as Map<String, dynamic>;
            if (data1["Friend"].length > 1) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(245, 233, 230, 230),
                        borderRadius: BorderRadius.circular(29.5)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Tìm kiếm',
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search, size: 25),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Friend")
                          .doc(
                              FirebaseAuth.instance.currentUser!.uid.toString())
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data1 =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Expanded(
                              child: ListView.builder(
                                  itemCount: data1["Friend"].length - 1,
                                  padding: EdgeInsets.only(left: 9.0),
                                  itemBuilder: (context, index) {
                                    return StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection("UserDetail")
                                            .doc(data1["Friend"][index + 1]
                                                ['email'])
                                            .snapshots(),
                                        builder: (context,
                                            AsyncSnapshot<DocumentSnapshot>
                                                snapshot) {
                                          if (snapshot.hasData) {
                                            Map<String, dynamic> data2 =
                                                snapshot.data!.data()
                                                    as Map<String, dynamic>;
                                            //print(data["email"]);
                                            //return Text("data");
                                            return ListFriendCard(
                                              checkonline: data2['checkonline'],
                                              email: data2['email'],
                                              fullname: data2['fullname'],
                                              img: data2['img'],
                                              uid: data2['uid'],
                                              press: () {},
                                            );
                                          } else
                                            return Text("NO DATA");
                                        });
                                  }));
                        } else
                          return Text("NO DATA");
                      })
                ],
              );
            } else
              return Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(245, 233, 230, 230),
                      borderRadius: BorderRadius.circular(29.5)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Tìm kiếm',
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, size: 25),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Addfriendtext(
                    press: () {
                      Navigator.pushNamed(context, AddFriendScreen.routeName);
                    },
                    text: "kết bạn"),
              ]);
          } else
            return Text("Lỗi kết nối");
        });
  }
}
