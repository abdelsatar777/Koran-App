import 'package:flutter/material.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/screens/khotab_screen.dart';
import '../presentation/screens/tasbeeh_screen.dart';
import '../presentation/screens/settings_screen.dart';
import '../presentation/screens/books_screen.dart';
import '../utils/colors.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  int _currentIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.mosque,
    Icons.menu_book,
    Icons.volunteer_activism,
    Icons.settings,
  ];
  final List<Widget> _pages = [
    HomeScreen(),
    KhotabScreen(),
    BooksScreen(),
    TasbeehScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 70,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_icons.length, (index) {
                bool isSelected = _currentIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSelected)
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.textColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              _icons[index],
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        )
                      else
                        Icon(
                          _icons[index],
                          color: Colors.white70,
                          size: 28,
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
