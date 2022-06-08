import 'package:chatapp/enums.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom.dart';
import 'conponents/body.dart';

class ListFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Friend",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.friend),
    );
  }
}
