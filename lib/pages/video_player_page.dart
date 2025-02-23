import 'package:flutter/material.dart';
import 'package:koran_app/presentation/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPage({super.key, required this.videoUrl});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {
              _chewieController = ChewieController(
                videoPlayerController: _videoController,
                aspectRatio: _videoController.value.aspectRatio,
                autoPlay: true,
                looping: false,
                allowFullScreen: true,
                allowMuting: true,
                materialProgressColors: ChewieProgressColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red,
                  backgroundColor: Colors.grey,
                  bufferedColor: Colors.white,
                ),
                placeholder: const Center(child: CircularProgressIndicator()),
                errorBuilder: (context, errorMessage) {
                  return Center(
                    child: Text(
                      "خطأ في تشغيل الفيديو",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "مشغل الفيديو"),
      body: Center(
        child: _chewieController != null
            ? Chewie(controller: _chewieController!)
            : const CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
