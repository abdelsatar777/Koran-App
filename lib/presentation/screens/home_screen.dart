import 'package:flutter/material.dart';
import '../widgets/custom_feature_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFeatureCard(
                  onTap: () {}, title: "التقويم", icon: Icons.calendar_month),
              CustomFeatureCard(
                  onTap: () {}, title: "دروس الدين", icon: Icons.person),
              CustomFeatureCard(
                  onTap: () {}, title: "حديث", icon: Icons.book_rounded),
              CustomFeatureCard(
                  onTap: () {}, title: "قرآن", icon: Icons.menu_book_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
