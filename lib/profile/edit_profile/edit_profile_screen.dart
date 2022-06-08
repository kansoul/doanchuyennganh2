import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:ms_free/size_config.dart';
// import '../../model/user.dart';
import 'conponents/body.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "/edit_profile";
  var collection = FirebaseFirestore.instance.collection('Users');
  late Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: SizedBox(),
        ),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/msfree-ec676.appspot.com/o/backgroup.png?alt=media&token=fd446ab7-abfa-4194-a766-2ee22d2c3aec"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Body()
        ],
      ),
    );
  }
}
