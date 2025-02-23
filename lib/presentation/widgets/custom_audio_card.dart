import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'dart:html' as html;

class CustomAudioCard extends StatefulWidget {
  final String title;
  final String description;
  final String audioUrl;

  const CustomAudioCard({
    super.key,
    required this.title,
    required this.description,
    required this.audioUrl,
  });

  @override
  State<CustomAudioCard> createState() => _CustomAudioCardState();
}

class _CustomAudioCardState extends State<CustomAudioCard> {
  static html.AudioElement? _currentAudio;
  static String? _currentPlayingUrl;
  static Duration _currentPosition = Duration.zero;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  bool _isExpanded = false; // 🔹 متغير لحالة التوسيع

  void playAudio(String url) {
    if (_currentPlayingUrl == url) {
      if (_isPlaying) {
        _currentAudio?.pause();
        _currentPosition = _position;
      } else {
        _currentAudio?.currentTime = _currentPosition.inSeconds.toDouble();
        _currentAudio?.play();
      }
      setState(() {
        _isPlaying = !_isPlaying;
      });
      return;
    }

    _currentAudio?.pause();
    _resetAllCards();

    _currentAudio = html.AudioElement(url);
    _currentPlayingUrl = url;

    _currentAudio!.onTimeUpdate.listen((event) {
      setState(() {
        _position = Duration(seconds: _currentAudio!.currentTime!.toInt());
        _duration = Duration(seconds: _currentAudio!.duration!.toInt());
      });
    });

    _currentAudio!.onEnded.listen((event) {
      setState(() {
        _position = Duration.zero;
        _isPlaying = false;
      });
    });

    _currentAudio!.play();
    setState(() {
      _isPlaying = true;
    });
  }

  void _resetAllCards() {
    setState(() {
      _position = Duration.zero;
      _isPlaying = false;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // العنوان
            Text(
              widget.title,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 8),
            // الوصف مع إمكانية التوسيع
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.description,
                  maxLines: _isExpanded ? null : 3, // 🔹 التحكم في عدد الأسطر
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                if (widget.description.length >
                    100) // 🔹 إظهار الزر فقط لو الوصف طويل
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(
                      _isExpanded ? "إخفاء" : "إظهار المزيد",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            // شريط التقدم
            Slider(
              min: 0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds.toDouble(),
              onChanged: (value) {
                _currentAudio?.currentTime = value;
                setState(() {
                  _position = Duration(seconds: value.toInt());
                });
              },
              activeColor: AppColors.primaryColor,
            ),
            // وقت البداية والنهاية
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(_position)),
                Text(_formatDuration(_duration)),
              ],
            ),
            const SizedBox(height: 10),
            // زر التشغيل
            Center(
              child: IconButton(
                iconSize: 40,
                icon: Icon(
                  _isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  color: AppColors.primaryColor,
                ),
                onPressed: () => playAudio(widget.audioUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currentAudio?.pause();
    super.dispose();
  }
}
