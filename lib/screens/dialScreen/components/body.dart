import 'package:flutter/material.dart';

import '../../../components/dial_user_pic.dart';
import '../../../components/rounded_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'dial_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            "Anna williams",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
          ),
          Text(
            "Calling…",
            style: TextStyle(color: Colors.white60),
          ),
          VerticalSpacing(),
          DialUserPic(image: "assets/images/calling_face.png"),
          Spacer(),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              DialButton(
                iconSrc: "assets/icons/Icon Mic.svg",
                text: "Audio",
                press: () {},
              ),
              DialButton(
                iconSrc: "assets/icons/Icon Volume.svg",
                text: "Microphone",
                press: () {},
                // press: () => Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => VideoCallScreem())),
              ),
              DialButton(
                iconSrc: "assets/icons/Icon Video.svg",
                text: "Video",
                press: () {},
              ),
              DialButton(
                iconSrc: "assets/icons/Icon Message.svg",
                text: "Message",
                press: () {},
              ),
              DialButton(
                iconSrc: "assets/icons/Icon User.svg",
                text: "Add contact",
                press: () {},
              ),
              DialButton(
                iconSrc: "assets/icons/Icon Voicemail.svg",
                text: "Voice mail",
                press: () {},
              ),
            ],
          ),
          VerticalSpacing(),
          RoundedButton(
            iconSrc: "assets/icons/call_end.svg",
            press: () {},
            color: kRedColor,
            iconColor: Colors.white,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
