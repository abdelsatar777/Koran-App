import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/presentation/widgets/custom_app_bar.dart';
import '../manager/cubit.dart';
import '../manager/state.dart';
import '../presentation/widgets/custom_audio_card.dart';
import '../presentation/widgets/custom_video_card.dart';
import 'video_player_page.dart';
import '../utils/colors.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  bool isChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "دروس الدين"),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // زر التبديل بين الفيديوهات والصوتيات
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildToggleButton("استماع", !isChange),
                  _buildToggleButton("مشاهده", isChange),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // عرض الفيديوهات أو الصوتيات
            Expanded(
              child: isChange ? _buildVideoList() : _buildAudioList(),
            ),
          ],
        ),
      ),
    );
  }

  // بناء زر التبديل بين استماع ومشاهدة
  Widget _buildToggleButton(String text, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isChange = text == "مشاهده"),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : const Color(0xFFEFEFEF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.textColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // قائمة الفيديوهات
  Widget _buildVideoList() {
    return BlocBuilder<VideoCubit, AppState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessVideosState) {
          final videos = state.videos;
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              final List<String> lessonNames = List.generate(
                video.attachments.length,
                (i) => "الدرس ${i + 1}",
              );

              return CustomVideoCard(
                title: video.title,
                description: video.description,
                lessons: lessonNames,
                onLessonSelected: (selectedLesson) {
                  int lessonIndex = lessonNames.indexOf(selectedLesson!);
                  String videoUrl = video.attachments[lessonIndex]["url"];

                  // فتح صفحة تشغيل الفيديو
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(videoUrl: videoUrl),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is ErrorState) {
          return Center(child: Text("حدث خطأ: ${state.errorMassage}"));
        }
        return const Center(child: Text("لا يوجد بيانات"));
      },
    );
  }

  // قائمة الصوتيات
  Widget _buildAudioList() {
    return BlocBuilder<AudiosCubit, AppState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessAudioState) {
          final audios = state.audios;
          return ListView.builder(
            itemCount: audios.length,
            itemBuilder: (context, index) {
              final audio = audios[index];
              return CustomAudioCard(
                title: audio.title,
                description: audio.description,
                audioUrl: audio.attachments.isNotEmpty
                    ? audio.attachments[0]["url"]
                    : "",
              );
            },
          );
        } else if (state is ErrorState) {
          return Center(child: Text("حدث خطأ: ${state.errorMassage}"));
        }
        return const Center(child: Text("لا يوجد بيانات"));
      },
    );
  }
}
