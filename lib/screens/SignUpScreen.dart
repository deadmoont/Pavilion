import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/temp.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   children: [
      //     // Video player
      //     SizedBox.expand(
      //       child: FittedBox(
      //         fit: BoxFit.cover,
      //         child: SizedBox(
      //           width: _controller.value.size?.width ?? 0,
      //           height: _controller.value.size?.height ?? 0,
      //           child: VideoPlayer(_controller),
      //         ),
      //       ),
      //     ),
      //     // Gradient overlay
      //     Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.bottomCenter,
      //           end: Alignment.topCenter,
      //           colors: [
      //             Colors.black.withOpacity(0.7),
      //             Colors.transparent,
      //           ],
      //           stops: [0.0, 0.5],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
