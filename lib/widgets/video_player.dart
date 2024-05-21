import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer(
      {super.key,
      required this.videoUrlNotifier});

  final ValueNotifier<String> videoUrlNotifier;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrlNotifier.value),
      ),
      autoPlay: false,
    );
    widget.videoUrlNotifier.addListener(updateVideoUrl);
  }

  void updateVideoUrl() {
    setState(() {
      flickManager.dispose();
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(widget.videoUrlNotifier.value),
        ),
        autoPlay: false,
      );
    });
  }

  @override
  void dispose() {
    widget.videoUrlNotifier.removeListener(updateVideoUrl);
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: Center(
        child: Container( 
          height: 200.h,
          color: Colors.red,
          child: FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: FlickVideoWithControls(
              closedCaptionTextStyle: const TextStyle(fontSize: 8),
              controls: FlickPortraitControls(
                  iconSize: 30,
                  progressBarSettings: FlickProgressBarSettings(
                    playedColor: Theme.of(context).colorScheme.secondary,
                    handleColor: Theme.of(context).colorScheme.secondary,
                    backgroundColor: Colors.red,
                    handleRadius: 10,
                    height: 10,
                    bufferedColor: Colors.transparent,
                  )),
              iconThemeData:
                  IconThemeData(color: Theme.of(context).colorScheme.secondary),
            ),
            flickVideoWithControlsFullscreen: FlickVideoWithControls(
              controls: FlickPortraitControls(
                  iconSize: 30,
                  progressBarSettings: FlickProgressBarSettings(
                    playedColor: Colors.amber,
                    handleColor: Colors.black,
                    backgroundColor: Colors.green,
                    handleRadius: 10,
                    height: 10,
                    bufferedColor: Colors.transparent,
                  )),
              iconThemeData: const IconThemeData(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
