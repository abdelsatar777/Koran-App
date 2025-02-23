import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/pages/surah_page.dart';

void main() {
  runApp(KoranApp());
}

class KoranApp extends StatelessWidget {
  const KoranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SurahCubit()..getSurah()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SurahPage(),
      ),
    );
  }
}
