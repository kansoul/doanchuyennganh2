import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';

class TextMessenger extends StatelessWidget {
  const TextMessenger({
    Key? key,
    required this.chat,
    required this.send,
  }) : super(key: key);
  final String chat;
  final bool send;
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75,
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(send ? 1 : 0.1),
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          chat,
          style: TextStyle(
            color: send
                ? Colors.white
                : Theme.of(context).textTheme.bodyText1!.color,
          ),
        ));
  }
}
