// import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/profile/profile/conponents/profile_menu.dart';
import 'package:chatapp/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:ms_free/profile/edit_profile/edit_profile_screen.dart';
// import 'package:ms_free/screens/splash/splash_screen.dart';
// import 'profile_menu.dart';
import '../../../firestore.dart';
import '../../edit_profile/edit_profile_screen.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 80),
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Tài khoản",
            icon: "assets/icons/User Icon.svg",
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(),
              ),
            ),
          ),
          ProfileMenu(
            text: "Lời mời kết bạn",
            icon: "assets/icons/Bill Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Trạng thái hoạt động",
            icon: "assets/icons/Discover.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Trợ giúp",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/Log out.svg",
            press: () async {
              checkoffline();
              await FirebaseAuth.instance.signOut();

              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
