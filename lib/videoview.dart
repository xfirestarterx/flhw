import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  @override
  createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController _controller;
  static const _url =
      'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_640_3MG.mp4';

  @override
  initState() {
    super.initState();
    _controller = VideoPlayerController.network(_url)
      ..initialize().then((_) => setState(() {}));
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  build(BuildContext ctx) {
    return _controller.value.initialized
        ? FittedBox(
            fit: BoxFit.fitWidth,
            child: SizedBox(
              // https://github.com/flutter/flutter/issues/31911#issuecomment-540927697
              width: _controller.value.aspectRatio,
              height: 1,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : Container();
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }
}
