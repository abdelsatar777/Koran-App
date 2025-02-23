import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/models/audio_model.dart';
import 'package:koran_app/models/ayahs_model.dart';
import 'package:koran_app/models/surah_model.dart';
import 'package:koran_app/models/video_model.dart';
import '../network/api_service.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  ApiService apiService = ApiService();

  getSurah() async {
    List<SurahModel> surah = [];
    emit(LoadingState());
    try {
      var data = await apiService.get(endPoint: "surah");
      for (var i in data["data"]) {
        surah.add(
          SurahModel(
            number: i["number"].toString(),
            name: i["name"] ?? "No Name",
            enName: i["englishName"] ?? "No Name",
            numberOfAyahs: i["numberOfAyahs"].toString(),
          ),
        );
      }
      emit(SuccessState(surah: surah));
    } catch (error) {
      emit(ErrorState(errorMassage: error.toString()));
    }
  }

  getAyahs({required String id}) async {
    List<AyahsModel> ayahs = [];
    emit(LoadingState());
    try {
      var data = await apiService.get(endPoint: "surah/$id/ar.alafasy");
      for (var i in data["data"]["ayahs"]) {
        ayahs.add(
          AyahsModel(
            number: i["number"].toString(),
            numberInSurah: i["numberInSurah"].toString(),
            text: i["text"] ?? "No Text",
          ),
        );
      }
      emit(SuccessAyahsState(ayahs: ayahs));
    } catch (error) {
      emit(ErrorState(errorMassage: error.toString()));
    }
  }
}

class VideoCubit extends Cubit<AppState> {
  VideoCubit() : super(InitialState());
  ApiService apiService = ApiService();

  getVideo() async {
    List<VideoModel> videos = [];
    emit(LoadingState());
    try {
      var data = await apiService.get_2(
          endPoint: "paV29H2gm56kvLPy/main/videos/ar/ar/1/15/json");
      for (var i in data["data"]) {
        videos.add(
          VideoModel(
            title: i["title"] ?? "No Title",
            description: i["description"] ?? "No Description",
            attachments: i["attachments"] ?? [],
          ),
        );
      }
      emit(SuccessVideosState(videos: videos));
    } catch (error) {
      emit(ErrorState(errorMassage: error.toString()));
    }
  }
}

class AudiosCubit extends Cubit<AppState> {
  AudiosCubit() : super(InitialState());
  ApiService apiService = ApiService();

  getAudios() async {
    List<AudioModel> audios = [];
    emit(LoadingState());
    try {
      var data = await apiService.get_2(
          endPoint: "paV29H2gm56kvLPy/main/audios/ar/ar/1/15/json");
      for (var i in data["data"]) {
        audios.add(
          AudioModel(
            title: i["title"] ?? "No Title",
            description: i["description"] ?? "No Description",
            attachments: i["attachments"] ?? [],
          ),
        );
      }
      emit(SuccessAudioState(audios: audios));
    } catch (error) {
      emit(ErrorState(errorMassage: error.toString()));
    }
  }
}
