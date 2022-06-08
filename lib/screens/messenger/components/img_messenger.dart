import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';

class ImgMessenger extends StatelessWidget {
  const ImgMessenger({
    Key? key,
    required this.chat,
    required this.send,
  }) : super(key: key);
  final String chat;
  final bool send;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width * 0.65,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(chat),
        ),
      ),
    );
  }
}
