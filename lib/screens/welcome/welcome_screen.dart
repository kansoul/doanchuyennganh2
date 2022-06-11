import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/chats_screen/chats_screen.dart';
import 'package:chatapp/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Spacer(flex: 2),
          Image.asset("assets/images/welcome_image.png"),
          Spacer(flex: 3),
          Text(
            "Chào mừng bạn đến với ứng dụng \nnhắn tin MS Free",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            "Kết nối với mọi người trở nên đơn giản \nhơn bao giờ hết.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64)),
          ),
          Spacer(flex: 3),
          FittedBox(
            child: TextButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    ),
                child: Row(
                  children: [
                    Text(
                      "Bỏ qua",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.8)),
                    ),
                    SizedBox(
                      width: kDefaultPadding / 4,
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 14,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.8))
                  ],
                )),
          ),
          Spacer(flex: 1),
        ],
      )),
    );
  }
}
