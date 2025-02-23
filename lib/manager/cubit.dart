import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/models/ayahs_model.dart';
import 'package:koran_app/models/surah_model.dart';
import '../network/api_service.dart';

class SurahCubit extends Cubit<AppState> {
  SurahCubit() : super(InitialState());
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
