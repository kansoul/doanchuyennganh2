import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

import '../../constants.dart';

class VideoCall_Screen extends StatefulWidget {
  const VideoCall_Screen({Key? key}) : super(key: key);

  @override
  State<VideoCall_Screen> createState() => _VideoCall_ScreenState();
}

class _VideoCall_ScreenState extends State<VideoCall_Screen> {
  // Instantiate the client
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: APP_ID,
      channelName: CHANNEL_NAME,
      tempToken: TEMPTOKEN,
    ),
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

// Build your layout
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: client),
              AgoraVideoButtons(client: client),
            ],
          ),
        ),
      ),
    );
  }
}
