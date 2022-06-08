import 'package:chatapp/components/filled_outline_button.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/messenger/messenger_screen.dart';
import 'package:chatapp/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/Chat.dart';
import 'chats_card.dart';
import 'friendcard.dart';

class Body extends StatelessWidget {
  //const Body({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Container(
                  height: 120,
                  //color: Colors.blue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 7.0),
                    itemCount: data["Friend"].length - 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (data["Friend"].length > 1) {
                        return StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("UserDetail")
                                .doc(data["Friend"][index + 1]['email'])
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                Map<String, dynamic> data = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                //print(data["email"]);
                                //return Text("data");
                                return FriendCard(
                                  checkonline: data['checkonline'],
                                  email: data['email'],
                                  fullname: data['fullname'],
                                  img: data['img'],
                                  uid: data['uid'],
                                  press: () {},
                                );
                              } else
                                return Text("Đồ ngu, không có bạn");
                            });
                      } else
                        return SizedBox.shrink();
                    },
                  ),
                );
              } else
                return Text("Đồ ngu, không có bạn");
            }),
        SizedBox(
          height: 7,
        ),
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
                    child: ListView.builder(
                        itemCount: data0.length - 1,
                        padding: EdgeInsets.fromLTRB(9, 5, 10, 5),
                        itemBuilder: (context, index) {
                          return StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Friend")
                                  .doc(FirebaseAuth.instance.currentUser!.uid
                                      .toString())
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  Map<String, dynamic> data1 = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  if (data1['Friend'].length == data0.length) {
                                    int _le =
                                        data0[data1['Friend'][index + 1]['uid']]
                                            .length;
                                    String _email =
                                        data1['Friend'][index + 1]['email'];
                                    print(_email);
                                    return StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection("UserDetail")
                                            .doc(_email)
                                            .snapshots(),
                                        builder: (context,
                                            AsyncSnapshot<DocumentSnapshot>
                                                snapshot) {
                                          if (snapshot.hasData) {
                                            Map<String, dynamic> data2 =
                                                snapshot.data!.data()
                                                    as Map<String, dynamic>;
                                            if (data0[data1['Friend'][index + 1]
                                                ['uid']][_le - 1]['text']) {
                                              return ChatsCard(
                                                checkonline:
                                                    data2['checkonline'],
                                                email: data2['email'],
                                                fullname: data2['fullname'],
                                                img: data2['img'],
                                                uid: data2['uid'],
                                                lastmessenger: data0[
                                                        data1['Friend']
                                                            [index + 1]['uid']]
                                                    [_le - 1]['messenger'],
                                                time: data0[data1['Friend']
                                                        [index + 1]['uid']]
                                                    [_le - 1]['time'],
                                                seen: data0[data1['Friend']
                                                        [index + 1]['uid']]
                                                    [_le - 1]['seen'],
                                                send: data0[data1['Friend']
                                                        [index + 1]['uid']]
                                                    [_le - 1]['send'],
                                                press: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                MessengerScreen(
                                                                  email: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['email'],
                                                                  fullname: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['fullname'],
                                                                  img: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['img'],
                                                                  uid: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['uid'],
                                                                ))),
                                              );
                                            } else {
                                              return ChatsCard(
                                                checkonline:
                                                    data2['checkonline'],
                                                email: data2['email'],
                                                fullname: data2['fullname'],
                                                img: data2['img'],
                                                uid: data2['uid'],
                                                lastmessenger: "Đã gửi 1 ảnh",
                                                time: data0[data1['Friend']
                                                        [index + 1]['uid']]
                                                    [_le - 1]['time'],
                                                seen: data0[data1['Friend']
                                                        [index + 1]['uid']]
                                                    [_le - 1]['seen'],
                                                send: data0[data1['Friend']
                                                        [index + 1]['uid']]
                                                    [_le - 1]['send'],
                                                press: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                MessengerScreen(
                                                                  email: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['email'],
                                                                  fullname: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['fullname'],
                                                                  img: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['img'],
                                                                  uid: data0[data1[
                                                                          'Friend']
                                                                      [index +
                                                                          1]['uid']][_le -
                                                                      1]['uid'],
                                                                ))),
                                              );
                                            }
                                          } else
                                            return Text(
                                                "Đồ ngu, éo có tin nhắn");
                                        });
                                  } else
                                    return Text("Đồ ngu, không có bạn");
                                } else
                                  return Text("Đồ ngu, không có bạn");
                              });
                        }));
              } else
                return Text("Đồ ngu, không có bạn");
            })
      ],
    );
  }
}
