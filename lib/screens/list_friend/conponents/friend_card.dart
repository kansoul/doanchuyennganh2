import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';

class ListFriendCard extends StatelessWidget {
  const ListFriendCard({
    Key? key,
    required this.press,
    required this.email,
    required this.fullname,
    required this.img,
    required this.uid,
    required this.checkonline,
  }) : super(key: key);
  final String email;
  final String fullname;
  final String img;
  final String uid;
  final bool checkonline;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 10, 1, 10),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(img),
                ),
                if (checkonline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 2),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullname,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Opacity(
                    //   opacity: 0.64,
                    //   child: Text(
                    //     chat.lastMessage,
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyle(
                    //         fontWeight: chat.isSeen
                    //             ? FontWeight.w900
                    //             : FontWeight.normal),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
