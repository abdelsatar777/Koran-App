import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/presentation/widgets/custom_app_bar.dart';
import '../utils/colors.dart';

class AyahsPage extends StatefulWidget {
  final String surahId;
  final String title;

  const AyahsPage({super.key, required this.surahId, required this.title});

  @override
  State<AyahsPage> createState() => _AyahsPageState();
}

class _AyahsPageState extends State<AyahsPage> {
  String? selectedAyah; // الآية المضغوط عليها
  final AudioPlayer _audioPlayer = AudioPlayer(); // مشغل الصوت

  @override
  void initState() {
    super.initState();
    context.read<AppCubit>().getAyahs(id: widget.surahId);
  }

  Future<void> _playAyahAudio(String ayahNumber) async {
    _audioPlayer.stop();
    try {
      String audioUrl =
          "https://cdn.islamic.network/quran/audio/128/ar.alafasy/$ayahNumber.mp3"; // رابط تشغيل الصوت
      await _audioPlayer.play(UrlSource(audioUrl)); // تشغيل الصوت
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("خطأ في تشغيل الصوت: $e"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      if (state is SuccessAyahsState) {
        return Scaffold(
          appBar: CustomAppBar(title: widget.title),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2),
                      color: Colors.grey[100],
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: state.ayahs.map((ayah) {
                          bool isSelected = selectedAyah == ayah.text;

                          return TextSpan(
                            text:
                                " ${(widget.surahId == "1") ? ayah.text : ayah.text.replaceAll("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", "").trim()} ",
                            style: TextStyle(
                              fontSize: 22,
                              color: isSelected ? Colors.blue : Colors.black87,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  selectedAyah = ayah.text;
                                });
                                _playAyahAudio(ayah.number);
                              },
                            children: [
                              TextSpan(
                                text: " (${ayah.numberInSurah}) ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? Colors.blue
                                      : AppColors.textColor,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (state is ErrorState) {
        return Scaffold(
          body: Center(child: Text("Error: ${state.errorMassage}")),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
        );
      }
    });
  }
}
