import 'package:chatapp/components/filled_outline_button.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/messenger/messenger_screen.dart';
import 'package:chatapp/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../components/addfriend_text.dart';
import '../../../firestore.dart';
import '../../../models/Chat.dart';
import '../../add_friend/add_friend.dart';
import 'chats_card.dart';
import 'friendcard.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('kk:mm').format(now);

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
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MessengerScreen(
                                                  email: data['email'],
                                                  fullname: data['fullname'],
                                                  img: data['img'],
                                                  uid: data['uid'],
                                                  checkonline:
                                                      data['checkonline'],
                                                )));
                                  },
                                );
                              } else
                                return Text("Trống");
                            });
                      } else
                        return SizedBox.shrink();
                    },
                  ),
                );
              } else
                return Text("Trống");
            }),
        SizedBox(
          height: 7,
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("LastMessenger")
                .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                //data0->messenger
                Map<String, dynamic> data0 =
                    snapshot.data!.data() as Map<String, dynamic>;

                if (data0.length > 1) {
                  //List lassmessenger = [];
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
                                    if (data1['Friend'].length ==
                                        data0.length) {
                                      // lassmessenger
                                      //     .sort((a, b) => a[1].compareTo(b[1]));
                                      // print(lassmessenger);
                                      String _email =
                                          data1['Friend'][index + 1]['email'];
                                      //print(_email);
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
                                              if (data0[data1['Friend']
                                                      [index + 1]['uid']][0]
                                                  ['text']) {
                                                return ChatsCard(
                                                  checkonline:
                                                      data2['checkonline'],
                                                  email: data2['email'],
                                                  fullname: data2['fullname'],
                                                  img: data2['img'],
                                                  uid: data2['uid'],
                                                  lastmessenger: data0[
                                                          data1['Friend']
                                                                  [index + 1]
                                                              ['uid']][0]
                                                      ['messenger'],
                                                  time: data0[data1['Friend']
                                                          [index + 1]['uid']][0]
                                                      ['time'],
                                                  seen: data0[data1['Friend']
                                                          [index + 1]['uid']][0]
                                                      ['seen'],
                                                  send: data0[data1['Friend']
                                                          [index + 1]['uid']][0]
                                                      ['send'],
                                                  press: () async {
                                                    var doc =
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'UserDetail')
                                                            .doc(FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .email
                                                                .toString());
                                                    doc.get().then((value) {
                                                      var ad = value.data();

                                                      updatelastmessengerunsend(
                                                          FirebaseAuth.instance
                                                              .currentUser!.uid
                                                              .toString(),
                                                          data2['uid'],
                                                          data2['email'],
                                                          data2['fullname'],
                                                          data2['img'],
                                                          data0[data1['Friend'][index + 1]['uid']]
                                                              [0]['messenger'],
                                                          true,
                                                          false,
                                                          data0[data1['Friend']
                                                                      [index + 1]
                                                                  ['uid']][0]
                                                              ['send'],
                                                          data0[data1['Friend']
                                                                      [index + 1]
                                                                  ['uid']][0]
                                                              ['time']);
                                                    }).catchError((error) => print(
                                                        "Failed loi ngu: $error"));
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MessengerScreen(
                                                                  email: data0[data1[
                                                                              'Friend']
                                                                          [
                                                                          index +
                                                                              1]['uid']]
                                                                      [
                                                                      0]['email'],
                                                                  fullname: data0[data1[
                                                                              'Friend']
                                                                          [
                                                                          index +
                                                                              1]['uid']][0]
                                                                      [
                                                                      'fullname'],
                                                                  img: data0[data1[
                                                                              'Friend']
                                                                          [
                                                                          index +
                                                                              1]['uid']]
                                                                      [
                                                                      0]['img'],
                                                                  uid: data0[data1[
                                                                              'Friend']
                                                                          [
                                                                          index +
                                                                              1]['uid']]
                                                                      [
                                                                      0]['uid'],
                                                                  checkonline:
                                                                      data2[
                                                                          'checkonline'],
                                                                )));
                                                  },
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
                                                          [index + 1]['uid']][0]
                                                      ['time'],
                                                  seen: data0[data1['Friend']
                                                          [index + 1]['uid']][0]
                                                      ['seen'],
                                                  send: data0[data1['Friend']
                                                          [index + 1]['uid']][0]
                                                      ['send'],
                                                  press: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MessengerScreen(
                                                                email: data0[data1[
                                                                            'Friend']
                                                                        [index +
                                                                            1]['uid']]
                                                                    [
                                                                    0]['email'],
                                                                fullname: data0[data1[
                                                                            'Friend']
                                                                        [index +
                                                                            1]['uid']][0]
                                                                    [
                                                                    'fullname'],
                                                                img: data0[data1[
                                                                            'Friend']
                                                                        [index +
                                                                            1]['uid']]
                                                                    [0]['img'],
                                                                uid: data0[data1[
                                                                            'Friend']
                                                                        [index +
                                                                            1]['uid']]
                                                                    [0]['uid'],
                                                                checkonline: data2[
                                                                    'checkonline'],
                                                              ))),
                                                );
                                              }
                                            } else
                                              return Addfriendtext(
                                                press: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      AddFriendScreen
                                                          .routeName);
                                                },
                                                text: "Kết bạn",
                                              );
                                          });
                                    } else
                                      return Addfriendtext(
                                        press: () {
                                          Navigator.pushNamed(context,
                                              AddFriendScreen.routeName);
                                        },
                                        text: "Kết bạn",
                                      );
                                  } else
                                    return Addfriendtext(
                                      press: () {
                                        Navigator.pushNamed(
                                            context, AddFriendScreen.routeName);
                                      },
                                      text: "Kết bạn",
                                    );
                                });
                          }));
                } else
                  return Addfriendtext(
                    press: () {
                      Navigator.pushNamed(context, AddFriendScreen.routeName);
                    },
                    text: "Kết bạn",
                  );
              } else
                return Addfriendtext(
                  press: () {
                    Navigator.pushNamed(context, AddFriendScreen.routeName);
                  },
                  text: "Kết bạn",
                );
            })
      ],
    );
  }
}

Future<List<String>> fetchFavorites() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  final userData = await firestore
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .get();

  var faves = userData.get("favorites");
  return faves;
}
