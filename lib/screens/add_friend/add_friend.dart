import 'package:chatapp/enums.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom.dart';
import 'conponents/body.dart';

class AddFriendScreen extends StatelessWidget {
  static String routeName = "/add_friend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Friend Request",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
