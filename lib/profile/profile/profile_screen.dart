import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/custom_bottom.dart';
import '../../enums.dart';
import 'conponents/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Profile",
      //   ),
      // ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
