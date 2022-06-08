import 'package:chatapp/screens/friend_request/friend_request.dart';
import 'package:chatapp/screens/list_friend/list_friend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../enums.dart';
import '../profile/profile/profile_screen.dart';
import '../screens/chats_screen/chats_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);
  final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {
    final Color inActiveIcon = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatsScreen(),
                ),
              ),
              icon: Icon(Icons.forum),
              color:
                  MenuState.home == selectedMenu ? kPrimaryColor : inActiveIcon,
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListFriend(),
                ),
              ),
              //Navigator.pushNamed(context, ProfileScreen.routeName),
              icon: Icon(Icons.people),
              color: MenuState.friend == selectedMenu
                  ? kPrimaryColor
                  : inActiveIcon,
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendRequest(),
                ),
              ),
              icon: Icon(Icons.person_add_alt_rounded),
              color: MenuState.friendrequest == selectedMenu
                  ? kPrimaryColor
                  : inActiveIcon,
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              ),
              //Navigator.pushNamed(context, ProfileScreen.routeName),
              icon: Icon(Icons.person),
              color: MenuState.profile == selectedMenu
                  ? kPrimaryColor
                  : inActiveIcon,
            ),
          ],
        ),
      ),
    );
  }
}
