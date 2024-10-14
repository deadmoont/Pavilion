import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class Detailcard extends StatefulWidget {
  final String videoUrl;
  final VoidCallback onVideoEnd; // Callback for video end
  const Detailcard({Key? key, required this.videoUrl, required this.onVideoEnd}) : super(key: key);

  @override
  State<Detailcard> createState() => _DetailcardState();
}

class _DetailcardState extends State<Detailcard> with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initializeVideoPlayer() {
    _videoController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoInitialize: true,
      looping: false,
      aspectRatio: 1/2,
      allowMuting: true,
      allowPlaybackSpeedChanging: true,
      showControlsOnInitialize: false,
    );

    _videoController.addListener(() {
      if (_videoController.value.position == _videoController.value.duration) {
        widget.onVideoEnd();
      }
    });
  }

  void _disposeVideoPlayer() {
    _videoController.pause();
    _videoController.dispose();
    _chewieController.dispose();
  }

  @override
  void dispose() {
    _disposeVideoPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}