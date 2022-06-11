import 'package:chatapp/enums.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom.dart';
import 'conponents/body.dart';

class FriendRequest extends StatelessWidget {
  const FriendRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yêu cầu kết bạn",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.friendrequest),
    );
  }
}
