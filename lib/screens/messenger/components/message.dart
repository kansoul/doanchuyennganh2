import 'package:chatapp/screens/messenger/components/img_messenger.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';
import 'text_message.dart';

class Messenger extends StatelessWidget {
  const Messenger({
    Key? key,
    required this.message,
    required this.send,
    required this.img,
    required this.text,
  }) : super(key: key);
  final String message;
  final bool send;
  final bool text;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            send == false ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (send == true) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(img),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            )
          ],
          text
              ? TextMessenger(
                  send: send,
                  chat: message,
                )
              : ImgMessenger(
                  send: send,
                  chat: message,
                )
        ],
      ),
    );
  }
}
