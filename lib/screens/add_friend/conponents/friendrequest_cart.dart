import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';

class FriendRequestCart extends StatelessWidget {
  const FriendRequestCart({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final Chat chat;
  //final

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.only(top: 13),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                    ),
                  )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                chat.lastMessage,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Text(
              "Chap nhan",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Color(0xff4350b3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
