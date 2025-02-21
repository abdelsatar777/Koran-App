import 'package:flutter/material.dart';
import 'package:koran_app/pages/home_page_wrapper.dart';

void main() {
  runApp(KoranApp());
}

class KoranApp extends StatelessWidget {
  const KoranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageWrapper(),
    );
  }
}
