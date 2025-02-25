import 'package:flutter/material.dart';
import 'package:koran_app/pages/surah_page.dart';
import 'package:koran_app/presentation/widgets/prayer_time_line.dart';
import 'package:koran_app/presentation/widgets/prayer_time_widget.dart';
import '../../pages/calendar_page.dart';
import '../../pages/books_hadiths_page.dart';
import '../../pages/lessons_page.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200, child: PrayerTimeWidget()),
            PrayerTimeline(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomFeatureCard(
                  title: "التقويم",
                  icon: "assets/img/التقويم.png",
                  targetPage: CalendarPage(),
                ),
                CustomFeatureCard(
                  title: "دروس الدين",
                  icon: "assets/img/الصلاه.png",
                  targetPage: LessonsPage(),
                ),
                CustomFeatureCard(
                  title: "الأحديث",
                  icon: "assets/img/الحديث.png",
                  targetPage: BooksHadithsPage(),
                ),
                CustomFeatureCard(
                  title: "القرآن",
                  icon: "assets/img/القراءن.png",
                  targetPage: SurahPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
