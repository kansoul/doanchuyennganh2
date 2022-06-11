import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:permission_handler/permission_handler.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// import '../../../firestore.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 115, width: 115, child: ImgPic());
  }
}

var collection = FirebaseFirestore.instance.collection('Users');

class ImgPic extends StatelessWidget {
  String img = "";
  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.currentUser!.uid.toString();
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: collection.doc("User").snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) print("error`````````````````");

            if (snapshot.hasData) {
              var data = snapshot.data!.data();
              img = snapshot.data?[
                      FirebaseAuth.instance.currentUser!.uid.toString() + "0"]
                  ["1"]["img"]; // <-- Your value
              print(img);
            }
            //print(img);
            return CircleAvatar(
              backgroundImage: NetworkImage(img),
            );
          },
        ),
        Positioned(
          right: -16,
          bottom: 0,
          child: SizedBox(
            height: 46,
            width: 46,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                primary: Colors.white,
                backgroundColor: Color(0xFFF5F6F9),
              ),
              onPressed: () => {uploadImage()},
              //onPressed: () => {},
              child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
            ),
          ),
        ),
      ],
    );
  }
}

uploadImage() async {
  FirebaseStorage storage = FirebaseStorage.instance;
  String imageUrl;
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
        addavta(imageUrl);
        addavtdetail(imageUrl);
      } catch (onError) {
        print("Error");
      }
    });
  } else {
    print('No Image Path Received');
  }
}
