import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addavta(String img) async {
  var item1 = FirebaseAuth.instance.currentUser!.uid.toString() + "0";
  var item2 = 1;
  var item3 = 'img';
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Users").doc("User");
  users
      .update({'$item1.$item2.$item3': img})
      .then((value) => print("Avatar Added"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> addusernc(String email, String fullname, String gender,
    String birthday, String phone, String address) async {
  var item1 = FirebaseAuth.instance.currentUser!.uid.toString();
  var item2 = 0;
  var item3 = 'img';
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Users").doc("User");
  users.update({
    '$item1.$item2.email': email,
    '$item1.$item2.fullname': fullname,
    '$item1.$item2.gender': gender,
    '$item1.$item2.birthday': birthday,
    '$item1.$item2.phone': phone,
    '$item1.$item2.address': address,
  });

  return;
}

Future<void> addimg(String img) async {
  var item1 = FirebaseAuth.instance.currentUser!.uid.toString() + "0";
  var item2 = 1;
  var item3 = 'img';
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Users").doc("User");

  // .then((value) => print("User Added Update"))
  // .catchError((error) => print("Failed to add user: $error"));
  users.update({'$item1.$item2.$item3': img});
  //     .then((value) => print("User Added Update"))
  //     .catchError((error) => print("Failed to add user: $error"));
  // ;
  return;
}

Future<void> updateuser(String email, String fullname, String gender,
    String birthday, String phone, String address) async {
  var item1 = FirebaseAuth.instance.currentUser!.uid.toString();
  var item2 = 0;
  var item3 = 'img';
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Users").doc("User");
  users.update({
    '$item1.$item2.email': email,
    '$item1.$item2.fullname': fullname,
    '$item1.$item2.gender': gender,
    '$item1.$item2.birthday': birthday,
    '$item1.$item2.phone': phone,
    '$item1.$item2.address': address,
    //'img': img
  });

  return;
}

Future<void> UserDetail(String fullname, String img) async {
  DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
      .collection("UserDetail")
      .doc(FirebaseAuth.instance.currentUser!.email.toString());
  users
      .set({
        'email': FirebaseAuth.instance.currentUser!.email.toString(),
        'uid': FirebaseAuth.instance.currentUser!.uid.toString(),
        'fullname': fullname,
        'img': img,
        'checkonline': true
      })
      .then((value) => print("UserDetail update"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> editUserDetail(String fullname) async {
  DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
      .collection("UserDetail")
      .doc(FirebaseAuth.instance.currentUser!.email.toString());
  users
      .update({
        'fullname': fullname,
      })
      .then((value) => print("UserDetail update"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> addavtdetail(String img) async {
  DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
      .collection("UserDetail")
      .doc(FirebaseAuth.instance.currentUser!.email.toString());
  users
      .update({'img': img})
      .then((value) => print("Avatar Added"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> checkonline() async {
  DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
      .collection("UserDetail")
      .doc(FirebaseAuth.instance.currentUser!.email.toString());
  users
      .update({'checkonline': true})
      .then((value) => print("Avatar Added"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> isonline(String email) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("UserDetail").doc(email);
  users
      .get()
      .then((value) => print("Check isonline"))
      .catchError((error) => print("Failed to Check isonline: $error"));
  ;
  return;
}

Future<void> checkoffline() async {
  DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
      .collection("UserDetail")
      .doc(FirebaseAuth.instance.currentUser!.email.toString());
  users
      .update({'checkonline': false})
      .then((value) => print("Avatar Added"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> addfriend(
    String uid1, String uid, String email, String img, String fullname) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Friend").doc(uid1);
  users
      .update({
        "Friend": FieldValue.arrayUnion([
          {"email": email, "img": img, "fullname": fullname, "uid": uid}
        ])
      })
      .then((value) => print("Avatar Added"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> addfriend1(
    String uid1, String uid, String email, String img, String fullname) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Friend").doc(uid1);
  users
      .update({
        "Friend": FieldValue.arrayUnion([
          {"email": email, "img": img, "fullname": fullname, "uid": uid}
        ])
      })
      .then((value) => print("Avatar Added"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> addfriendreq(String email1, String email, String img, String uid,
    String fullname) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("FriendReq").doc(email1);
  users
      .update({
        "friend": FieldValue.arrayUnion([
          {
            "email": email,
            "img": img,
            "fullname": fullname,
            "uid": uid,
          }
        ])
      })
      .then((value) => print("Avatar Added"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> deletefriendrq(String email1, String email, String img, String uid,
    String fullname) async {
  //String a = "friend";
  DocumentReference ref =
      FirebaseFirestore.instance.collection("FriendReq").doc(email1);
  ref
      .update({
        "friend": FieldValue.arrayRemove([
          {
            "email": email,
            "fullname": fullname,
            "img": img,
            "uid": uid,
          }
        ])
      })
      .then((value) => print("Delete"))
      .catchError((error) => print("Failed to add user: $error"));
  ;
  return;
}

Future<void> messengerhellosend(
    String uid0,
    String uid1,
    String email,
    String fullname,
    String img,
    String messenger,
    bool text,
    bool seen,
    bool send,
    String time) async {
  //String a = "friend";
  DocumentReference ref =
      FirebaseFirestore.instance.collection("Messenger").doc(uid0);
  ref
      .update({
        uid1: FieldValue.arrayUnion([
          {
            "email": email,
            "fullname": fullname,
            "img": img,
            "messenger": messenger,
            "text": text,
            "seen": seen,
            "send": send,
            "time": time,
            "uid": uid1,
          }
        ])
      })
      .then((value) => print("Update messenger"))
      .catchError((error) => print("Failed to update messenger user: $error"));
  ;
  return;
}

Future<void> messengerhellounsend(
    String uid0,
    String uid1,
    String email,
    String fullname,
    String img,
    String messenger,
    bool text,
    bool seen,
    bool send,
    String time) async {
  //String a = "friend";
  DocumentReference ref =
      FirebaseFirestore.instance.collection("Messenger").doc(uid0);
  ref
      .update({
        uid1: FieldValue.arrayUnion([
          {
            "email": email,
            "fullname": fullname,
            "img": img,
            "messenger": messenger,
            "text": text,
            "seen": seen,
            "send": send,
            "time": time,
            "uid": uid1,
          }
        ])
      })
      .then((value) => print("Update messenger"))
      .catchError((error) => print("Failed to update messenger user: $error"));
  ;
  return;
}

Future<void> createchat(String uid) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Messenger").doc(uid);
  users
      .set({
        "Chat": FieldValue.arrayUnion([
          {
            "Hello": "Hello",
          }
        ])
      })
      .then((value) => print("Create chat done"))
      .catchError((error) => print("Failed to create chat: $error"));
  ;
  return;
}

Future<void> createfriend(String uid) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("Friend").doc(uid);
  users
      .set({
        "Friend": FieldValue.arrayUnion([{}])
      })
      .then((value) => print("Create chat done"))
      .catchError((error) => print("Failed to create chat: $error"));
  ;
  return;
}

Future<void> createfriendreq(String email) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("FriendReq").doc(email);
  users
      .set({
        "friend": FieldValue.arrayUnion([{}])
      })
      .then((value) => print("Create friendreq done"))
      .catchError((error) => print("Failed to create friendreq: $error"));
  ;
  return;
}

Future<void> lastmessengersend(
    String uid0,
    String uid1,
    String email,
    String fullname,
    String img,
    String messenger,
    bool text,
    bool seen,
    bool send,
    String time) async {
  //String a = "friend";
  DocumentReference ref =
      FirebaseFirestore.instance.collection("LastMessenger").doc(uid0);
  ref
      .update({
        uid1: FieldValue.arrayUnion([
          {
            "email": email,
            "fullname": fullname,
            "img": img,
            "messenger": messenger,
            "text": text,
            "seen": seen,
            "send": send,
            "time": time,
            "uid": uid1,
          }
        ])
      })
      .then((value) => print("Update messenger"))
      .catchError((error) => print("Failed to update messenger user: $error"));
  ;
  return;
}

Future<void> lastmessengerunsend(
    String uid0,
    String uid1,
    String email,
    String fullname,
    String img,
    String messenger,
    bool text,
    bool seen,
    bool send,
    String time) async {
  //String a = "friend";
  DocumentReference ref =
      FirebaseFirestore.instance.collection("LastMessenger").doc(uid0);
  ref
      .update({
        uid1: FieldValue.arrayUnion([
          {
            "email": email,
            "fullname": fullname,
            "img": img,
            "messenger": messenger,
            "text": text,
            "seen": seen,
            "send": send,
            "time": time,
            "uid": uid1,
          }
        ])
      })
      .then((value) => print("Update messenger"))
      .catchError((error) => print("Failed to update messenger user: $error"));
  ;
  return;
}

Future<void> createchatlast(String uid) async {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("LastMessenger").doc(uid);
  users
      .set({
        "Chat": FieldValue.arrayUnion([
          {
            "Hello": "Hello",
          }
        ])
      })
      .then((value) => print("Create chat done"))
      .catchError((error) => print("Failed to create chat: $error"));
  ;
  return;
}

Future<void> updatelastmessengersend(
    String uid0,
    String uid1,
    String email,
    String fullname,
    String img,
    String messenger,
    bool text,
    bool seen,
    bool send,
    String time) async {
  DocumentReference ref =
      FirebaseFirestore.instance.collection("LastMessenger").doc(uid0);
  ref.update({uid1: FieldValue.delete()}).then((value) {
    ref
        .update({
          uid1: FieldValue.arrayUnion([
            {
              "email": email,
              "fullname": fullname,
              "img": img,
              "messenger": messenger,
              "text": text,
              "seen": seen,
              "send": send,
              "time": time,
              "uid": uid1,
            }
          ])
        })
        .then((value) => print("Update last messenger"))
        .catchError(
            (error) => print("Failed to update messenger user: $error"));
  }).catchError((error) => print("Failed to update messenger user: $error"));
  ;
  return;
}

Future<void> updatelastmessengerunsend(
    String uid0,
    String uid1,
    String email,
    String fullname,
    String img,
    String messenger,
    bool text,
    bool seen,
    bool send,
    String time) async {
  DocumentReference ref =
      FirebaseFirestore.instance.collection("LastMessenger").doc(uid0);
  ref.update({uid1: FieldValue.delete()}).then((value) {
    ref
        .update({
          uid1: FieldValue.arrayUnion([
            {
              "email": email,
              "fullname": fullname,
              "img": img,
              "messenger": messenger,
              "text": text,
              "seen": seen,
              "send": send,
              "time": time,
              "uid": uid1,
            }
          ])
        })
        .then((value) => print("Update last messenger"))
        .catchError(
            (error) => print("Failed to update messenger user: $error"));
  }).catchError((error) => print("Failed to update messenger user: $error"));
  ;
  return;
}
