import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koran_app/utils/colors.dart';

class PrayerTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> prayers = [
    {"time": "20:00", "icon": Icons.brightness_3}, // العشاء
    {"time": "18:30", "icon": Icons.nightlight_round}, // المغرب
    {"time": "15:45", "icon": Icons.wb_sunny_outlined}, // العصر
    {"time": "12:30", "icon": Icons.wb_sunny}, // الظهر
    {"time": "06:15", "icon": Icons.sailing}, // الشروق
    {"time": "05:00", "icon": Icons.nights_stay}, // الفجر
  ];

  PrayerTimeline({super.key});

  int getCurrentPrayerIndex() {
    String now = DateFormat("HH:mm").format(DateTime.now());
    for (int i = 0; i < prayers.length; i++) {
      if (now.compareTo(prayers[i]["time"]) < 0) {
        return i - 1; // ترجع آخر صلاة مرت
      }
    }
    return prayers.length - 1; // لو الوقت بعد العشاء
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = getCurrentPrayerIndex();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: List.generate(prayers.length, (index) {
              bool isActive = index <= currentIndex;
              return Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (index > 0)
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 2,
                          color: isActive
                              ? AppColors.primaryColor
                              : Colors.grey[300],
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
                      ),
                      child: CircleAvatar(
                        backgroundColor:
                            isActive ? AppColors.primaryColor : Colors.white,
                        radius: 15,
                        child: isActive
                            ? Icon(Icons.check, color: Colors.white, size: 20)
                            : Container(),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              prayers.length,
              (index) => Icon(
                prayers[index]["icon"],
                color: index <= currentIndex
                    ? AppColors.primaryColor
                    : Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
