import 'package:chatapp/enums.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom.dart';
import 'component/body.dart';

class SearchFriend extends StatelessWidget {
  final String search;

  const SearchFriend({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tìm kiếm",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Body(search: search),
    );
  }
}
