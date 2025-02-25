import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koran_app/utils/colors.dart';

class PrayerTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> prayers = [
    {"time": "05:07 AM", "icon": Icons.nights_stay}, // الفجر
    {"time": "06:34 AM", "icon": Icons.sailing}, // الشروق
    {"time": "12:09 PM", "icon": Icons.wb_sunny}, // الظهر
    {"time": "03:33 PM", "icon": Icons.wb_sunny_outlined}, // العصر
    {"time": "05:44 PM", "icon": Icons.nightlight_round}, // المغرب
    {"time": "07:03 PM", "icon": Icons.brightness_3}, // العشاء
  ];

  PrayerTimeline({super.key});

  int getCurrentPrayerIndex() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat("hh:mm a"); // تنسيق 12 ساعة

    for (int i = 0; i < prayers.length; i++) {
      // تحويل الوقت إلى اليوم الحالي
      DateTime prayerTime = format.parse(prayers[i]["time"]);
      prayerTime = DateTime(
          now.year, now.month, now.day, prayerTime.hour, prayerTime.minute);

      if (now.isBefore(prayerTime)) {
        return i - 1; // آخر صلاة دخل وقتها
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
          // الخط الزمني للصلوات
          Row(
            children: List.generate(prayers.length, (index) {
              bool isPassed = index <= currentIndex; // الصلوات السابقة
              bool isCurrent = index == currentIndex; // الصلاة الحالية

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
                          color: isPassed
                              ? AppColors.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isCurrent
                              ? AppColors.primaryColor
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor:
                            isPassed ? AppColors.primaryColor : Colors.white,
                        radius: 15,
                        child: isPassed
                            ? Icon(Icons.check, color: Colors.white, size: 18)
                            : isCurrent
                                ? Icon(Icons.access_time,
                                    color: AppColors.primaryColor, size: 18)
                                : Container(),
                      ),
                    ),
                  ],
                ),
              );
            }).reversed.toList(), // عكس الترتيب ليكون الفجر على اليسار
          ),

          const SizedBox(height: 10),

          // أيقونات وأوقات الصلوات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              prayers.length,
              (index) => Column(
                children: [
                  Icon(
                    prayers[index]["icon"],
                    color: index == currentIndex
                        ? AppColors.primaryColor
                        : Colors.black54,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    prayers[index]["time"],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: index == currentIndex
                          ? AppColors.primaryColor
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            )
                .reversed
                .toList(), // عكس الترتيب ليكون الفجر في اليسار والعشاء في اليمين
          ),
        ],
      ),
    );
  }
}
