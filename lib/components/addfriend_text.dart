import 'package:flutter/material.dart';

class Addfriendtext extends StatelessWidget {
  const Addfriendtext({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hãy"),
        TextButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: Colors.blue),
          ),
        ),
        Text("để trải nghiệm ứng dụng"),
      ],
    );
  }
}
