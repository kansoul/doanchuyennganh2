import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({
    Key? key,
    required this.email,
    required this.fullname,
    required this.img,
    required this.uid,
    required this.checkonline,
    required this.press,
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
        padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 2),
        child: SizedBox(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 32,
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
              SizedBox(
                height: 6.0,
              ),
              Text(
                fullname,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
