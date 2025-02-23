import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/pages/home_page_wrapper.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageWrapper(),
      ),
    );
  }
}
