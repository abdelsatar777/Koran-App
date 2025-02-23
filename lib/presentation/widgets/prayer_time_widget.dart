import 'package:flutter/material.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/img/wallpaper.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.4), // شفافية 30%
          ),
        ),
        // التاريخ
        Positioned(
          bottom: 130,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الثلاثاء، 13 مارس",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "3 رمضان | 1445 هجري",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        // أيقونة التنبيه
        Positioned(
          top: 30,
          right: 30,
          child:
              Icon(Icons.notifications_active, color: Colors.white, size: 30),
        ),
        // الموقع الجغرافي
        Positioned(
          bottom: 30,
          right: 20,
          child: Text(
            "القليوبيه, العبور",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
