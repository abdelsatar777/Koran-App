import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/utils/colors.dart';

import '../presentation/widgets/custom_app_bar.dart';
import '../presentation/widgets/custom_surah_card.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  void initState() {
    super.initState();
    context.read<AppCubit>().getSurah();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
            appBar: CustomAppBar(title: "السور"),
            body: ListView.builder(
              itemCount: state.surah.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomSurahCard(
                    surahModel: state.surah[index],
                  ),
                );
              },
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
      },
    );
  }
}
