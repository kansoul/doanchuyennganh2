import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/add_friend/add_friend.dart';
import 'package:chatapp/screens/chats_screen/components/body.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom.dart';
import '../../enums.dart';

class ChatsScreen extends StatefulWidget {
  static String routeName = "/chatscreen";
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            "assets/images/Logo_light.png",
            width: 50,
            height: 50,
          ),
          Text(
            "Đoạn chat",
            style: TextStyle(color: Colors.black, fontSize: 24),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AddFriendScreen.routeName);
          },
          icon: Icon(Icons.person_add),
          color: Colors.black,
        )
      ],
    );
  }
}
