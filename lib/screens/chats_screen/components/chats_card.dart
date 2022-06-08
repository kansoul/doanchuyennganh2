import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';

class ChatsCard extends StatelessWidget {
  const ChatsCard({
    Key? key,
    required this.email,
    required this.fullname,
    required this.img,
    required this.uid,
    required this.checkonline,
    required this.lastmessenger,
    required this.press,
    required this.time,
    required this.seen,
    required this.send,
  }) : super(key: key);
  final String email;
  final String time;
  final String fullname;
  final String img;
  final String uid;
  final String lastmessenger;
  final bool checkonline;
  final bool seen;
  final bool send;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.fromLTRB(7, 10, 1, 10),
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
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        send == true ? lastmessenger : "Bạn: $lastmessenger",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight:
                                seen ? FontWeight.w900 : FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Opacity(opacity: 0.64, child: Text(time))
          ],
        ),
      ),
    );
  }
}
