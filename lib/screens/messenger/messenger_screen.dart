import 'package:chatapp/constants.dart';

import 'package:flutter/material.dart';

import '../dialScreen/dial_screen.dart';
import 'components/body.dart';

class MessengerScreen extends StatelessWidget {
  final String email;
  final String fullname;
  final String img;
  final String uid;

  const MessengerScreen(
      {Key? key,
      required this.email,
      required this.fullname,
      required this.img,
      required this.uid})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: NetworkImage(img),
            ),
            SizedBox(
              width: kDefaultPadding * 0.75,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DialScreen())),
              icon: Icon(Icons.local_phone)),
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DialScreen(),
                    ),
                  ),
              icon: Icon(Icons.videocam)),
          SizedBox(
            width: kDefaultPadding / 2,
          )
        ],
      ),
      body: Body(email: email, fullname: fullname, img: img, uid: uid),
    );
  }
}

//   AppBar buildAppBar() {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       title: Row(
//         children: [
//           BackButton(),
//           CircleAvatar(
//             backgroundImage: AssetImage("assets/images/user_2.png"),
//           ),
//           SizedBox(
//             width: kDefaultPadding * 0.75,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "H??? V??n ??oan",
//                 style: TextStyle(fontSize: 16),
//               ),
//               Text(
//                 "Online 3h tr?????c",
//                 style: TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//         ],
//       ),
//       actions: [
//         IconButton(onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => MessengerScreen())), icon: Icon(Icons.local_phone)),
//         IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
//         SizedBox(
//           width: kDefaultPadding / 2,
//         )
//       ],
//     );
//   }
// }
