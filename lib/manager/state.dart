import 'package:koran_app/models/audio_model.dart';
import 'package:koran_app/models/ayahs_model.dart';
import 'package:koran_app/models/book_hadiths_model.dart';
import 'package:koran_app/models/books_model.dart';
import 'package:koran_app/models/khotab_model.dart';
import 'package:koran_app/models/surah_model.dart';
import 'package:koran_app/models/video_model.dart';

import '../models/hadiths_model.dart';

abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class SuccessState extends AppState {
  final List<SurahModel> surah;

  SuccessState({required this.surah});
}

class SuccessAyahsState extends AppState {
  final List<AyahsModel> ayahs;

  SuccessAyahsState({required this.ayahs});
}

class SuccessVideosState extends AppState {
  final List<VideoModel> videos;

  SuccessVideosState({required this.videos});
}

class SuccessAudioState extends AppState {
  final List<AudioModel> audios;

  SuccessAudioState({required this.audios});
}

class SuccessBookHadithState extends AppState {
  final List<BookHadithsModel> bookHadithsModel;

  SuccessBookHadithState({required this.bookHadithsModel});
}

class SuccessHadithState extends AppState {
  final List<HadithsModel> hadithsModel;

  SuccessHadithState({required this.hadithsModel});
}

class SuccessKhotabState extends AppState {
  final List<KhotabModel> khotab;

  SuccessKhotabState({required this.khotab});
}

class SuccessBooksState extends AppState {
  final List<BooksModel> books;

  SuccessBooksState({required this.books});
}

class ErrorState extends AppState {
  final String errorMassage;

  ErrorState({required this.errorMassage});
}
