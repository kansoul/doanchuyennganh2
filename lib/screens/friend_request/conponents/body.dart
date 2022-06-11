import 'package:chatapp/components/addfriend_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../../../components/default_button.dart';
import '../../../components/primary_button.dart';
import '../../../firestore.dart';
import '../../../models/Chat.dart';
import 'package:intl/intl.dart';

import '../../add_friend/add_friend.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('kk:mm').format(now);

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("FriendReq")
            .doc(FirebaseAuth.instance.currentUser!.email.toString())
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          // DocumentSnapshot doc = snapshot.data!.docs[index];
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            if (data['friend'].length > 1) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 1, horizontal: 10),
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
                    viewFriendRequest(),
                    Column(
                      children: [
                        GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.9,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemCount: data["friend"].length - 1,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              //print(data["friend"].length);
                              return gridViewItem(
                                  name: data["friend"][index + 1]["fullname"],
                                  email: data["friend"][index + 1]['email'],
                                  // status: data["friend"][index]['checkonline'],
                                  image: data["friend"][index + 1]['img'],
                                  uid: data["friend"][index + 1]['uid'],
                                  index: index);
                            }),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                  child: Column(children: [
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
                    text: "Kết bạn")
              ]));
            }
          } else {
            return Text("No data");
          }
        });
  }
}

Widget totalFriendContainer() {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.shade300,
          )
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Friend",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "206",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF4530B3).withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
              child: Text(
            "View detail",
            style: TextStyle(
                color: Color(0xFF4530B3), fontWeight: FontWeight.bold),
          )),
        ),
      ],
    ),
  );
}

Widget viewFriendRequest() {
  return Container(
    padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Lời mời kết bạn",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
        )
      ],
    ),
  );
}

Widget gridViewItem({
  required String name,
  required String uid,
  required String email,
  bool status = true,
  required String image,
  required int index,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    elevation: 4,
    shadowColor: Colors.grey.shade100,
    child: Container(
      padding: EdgeInsets.only(top: 23),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0XFF4530B3),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            status == false ? Colors.amber : Color(0xff31c911),
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 3,
                        )),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            status == true ? "Online" : "Offline",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () async {
                    addfriend(
                      FirebaseAuth.instance.currentUser!.uid.toString(),
                      uid,
                      email,
                      image,
                      name,
                    );

                    deletefriendrq(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      email,
                      image,
                      uid,
                      name,
                    );
                    //print(email+);
                    // messengerhello(
                    //     FirebaseAuth.instance.currentUser!.uid.toString(),
                    //     uid,
                    //     email,
                    //     name,
                    //     image,
                    //     "Hello 12",
                    //     true,
                    //     true,
                    //     "7h");

                    var document = await FirebaseFirestore.instance
                        .collection('UserDetail')
                        .doc(FirebaseAuth.instance.currentUser!.email
                            .toString());
                    document.get().then((value) {
                      var ad = value.data();
                      print(ad!['uid']);

                      addfriend(uid, ad['uid'], ad['email'], ad['img'],
                          ad['fullname']);
                      addfriend1(ad['uid'], uid, email, image, name);

                      // messengerhello(uid, ad['uid'], ad['email'],
                      //     ad['fullname'], ad['img'], "Hello", true, true, "7h");
                    }).catchError((error) => print("Failed loi ngu: $error"));

                    var doc = await FirebaseFirestore.instance
                        .collection('UserDetail')
                        .doc(FirebaseAuth.instance.currentUser!.email
                            .toString());
                    doc.get().then((value) {
                      var ad = value.data();
                      //print(ad!['uid']);

                      // addfriend(uid, ad['uid'], ad['email'], ad['img'],
                      //     ad['fullname']);

                      messengerhellosend(
                          uid,
                          ad!['uid'],
                          ad['email'],
                          ad['fullname'],
                          ad['img'],
                          "Hello",
                          true,
                          true,
                          true,
                          formattedDate);
                      messengerhellounsend(
                          FirebaseAuth.instance.currentUser!.uid.toString(),
                          uid,
                          email,
                          name,
                          image,
                          "Hello",
                          true,
                          true,
                          false,
                          formattedDate);
                      lastmessengersend(
                          uid,
                          ad['uid'],
                          ad['email'],
                          ad['fullname'],
                          ad['img'],
                          "Hello",
                          true,
                          true,
                          true,
                          formattedDate);
                      lastmessengersend(
                          FirebaseAuth.instance.currentUser!.uid.toString(),
                          uid,
                          email,
                          name,
                          image,
                          "Hello",
                          true,
                          true,
                          false,
                          formattedDate);
                    }).catchError((error) => print("Failed loi ngu: $error"));
                  },
                  child: Text('Đồng ý'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text('Từ chối'),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
