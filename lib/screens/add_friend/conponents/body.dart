import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/primary_button.dart';
import '../../../firestore.dart';
import '../../../models/Chat.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("UserDetail")
            .where("email",
                isNotEqualTo:
                    FirebaseAuth.instance.currentUser!.email.toString())
            .snapshots(),
        builder: (context, snapshot) {
          // DocumentSnapshot doc = snapshot.data!.docs[index];
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
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
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc;
                            doc = snapshot.data!.docs[index];

                            return gridViewItem(
                                name: doc['fullname'],
                                email: doc['email'],
                                status: doc['checkonline'],
                                image: doc['img'],
                                uid: doc['uid']);
                          }),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text("No data");
          }
        });
  }
}

Widget totalFriendContainer() {
  return Container(
    height: 100,
    //color: Colors.red,
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
          "Gợi ý kết bạn",
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
  required bool status,
  required String image,
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
                    // addfriendreq(
                    //   email,
                    //   FirebaseAuth.instance.currentUser!.email.toString(),
                    //   image,

                    //   uid,
                    //   name,
                    // );
                    print(email);
                    var document = await FirebaseFirestore.instance
                        .collection('UserDetail')
                        .doc(FirebaseAuth.instance.currentUser!.email
                            .toString());
                    document.get().then((value) {
                      var ad = value.data();
                      print(ad!['uid']);
                      addfriendreq(email, ad['email'], ad['img'], ad['uid'],
                          ad['fullname']);
                    }).catchError((error) => print("Failed loi ngu: $error"));
                  },
                  child: Text('Kết bạn'),
                ),
                // TextButton(
                //   style: TextButton.styleFrom(
                //     primary: Colors.blue,
                //   ),
                //   onPressed: () {},
                //   child: Text('Từ chối'),
                // )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
