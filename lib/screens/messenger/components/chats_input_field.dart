import 'package:chatapp/firestore.dart';
import 'package:chatapp/screens/messenger/components/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import 'dart:io';

class ChatsInputField extends StatelessWidget {
  final String email;
  final String fullname;
  final String img;
  final String uid;

  const ChatsInputField(
      {Key? key,
      required this.email,
      required this.fullname,
      required this.img,
      required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController messengercontroller = TextEditingController();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.08),
            ),
          ]),
      child: SafeArea(
          child: Row(
        children: [
          IconButton(
              onPressed: () async {
                var doc = await FirebaseFirestore.instance
                    .collection('UserDetail')
                    .doc(FirebaseAuth.instance.currentUser!.email.toString());
                doc.get().then((value) {
                  var ad = value.data();
                  print(ad!['uid']);
                  uploadImage(
                      uid,
                      ad['uid'],
                      ad['email'],
                      ad['fullname'],
                      ad['img'],
                      FirebaseAuth.instance.currentUser!.uid.toString(),
                      email,
                      img);
                  // addfriend(uid, ad['uid'], ad['email'], ad['img'],
                  //     ad['fullname']);
                }).catchError((error) => print("Failed gui tin nhan: $error"));
              },
              icon: Icon(
                Icons.photo,
                color: kPrimaryColor,
              )),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messengercontroller,
                      decoration: InputDecoration(
                          hintText: "Type message", border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () async {
                var doc = await FirebaseFirestore.instance
                    .collection('UserDetail')
                    .doc(FirebaseAuth.instance.currentUser!.email.toString());
                doc.get().then((value) {
                  var ad = value.data();
                  print(ad!['uid']);

                  // addfriend(uid, ad['uid'], ad['email'], ad['img'],
                  //     ad['fullname']);

                  messengerhellosend(
                      uid,
                      ad['uid'],
                      ad['email'],
                      ad['fullname'],
                      ad['img'],
                      messengercontroller.text,
                      true,
                      true,
                      true,
                      formattedDate);
                  messengerhellounsend(
                      FirebaseAuth.instance.currentUser!.uid.toString(),
                      uid,
                      email,
                      fullname,
                      img,
                      messengercontroller.text,
                      true,
                      false,
                      false,
                      formattedDate);
                  updatelastmessengersend(
                      uid,
                      ad['uid'],
                      ad['email'],
                      ad['fullname'],
                      ad['img'],
                      messengercontroller.text,
                      true,
                      true,
                      true,
                      formattedDate);
                  updatelastmessengerunsend(
                      FirebaseAuth.instance.currentUser!.uid.toString(),
                      uid,
                      email,
                      fullname,
                      img,
                      messengercontroller.text,
                      true,
                      false,
                      false,
                      formattedDate);
                  messengercontroller.clear();
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                }).catchError((error) => print("Failed gui tin nhan: $error"));
              },
              icon: Icon(
                Icons.send,
                color: kPrimaryColor,
              )),
        ],
      )),
    );
  }
}

uploadImage(
  String uid1,
  String uid2,
  String email,
  String fullname,
  String img,
  String email1,
  String fullname1,
  String img1,
) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  String imageUrl;
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm').format(now);
  //Check Permissions
  //await Permission.photos.request();

  //var permissionStatus = await Permission.photos.status;

  //Select Image
  final XFile? image =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image != null) {
    //Upload to Firebase
    Reference ref = storage.ref().child("images/" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(File(image.path));
    uploadTask.whenComplete(() async {
      try {
        imageUrl = await ref.getDownloadURL();
        //addavta(imageUrl);
        //addavtdetail(imageUrl);

        messengerhellosend(uid1, uid2, email, fullname, img, imageUrl, false,
            true, true, formattedDate);
        messengerhellounsend(uid2, uid1, email1, fullname1, img1, imageUrl,
            false, false, false, formattedDate);
      } catch (onError) {
        print("Error");
      }
    });
  } else {
    print('No Image Path Received');
  }
}
