import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/pages/splash_page.dart';

void main() {
  runApp(KoranApp());
}

class KoranApp extends StatelessWidget {
  const KoranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..getSurah()),
        BlocProvider(create: (context) => VideoCubit()..getVideo()),
        BlocProvider(create: (context) => AudiosCubit()..getAudios()),
        BlocProvider(create: (context) => HadithCubit()..getBookHadith()),
        BlocProvider(create: (context) => KhotabCubit()..getKhotab()),
        BlocProvider(create: (context) => BooksCubit()..getBooks()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
