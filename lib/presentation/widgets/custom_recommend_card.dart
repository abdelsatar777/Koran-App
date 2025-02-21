import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class CustomRecommendCard extends StatelessWidget {
  const CustomRecommendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // لون الظل
            blurRadius: 8, // مقدار التمويه
            offset: Offset(0, 4), // إزاحة الظل
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bookmark, size: 26, color: AppColors.primaryColor),
                  SizedBox(width: 10),
                  Icon(Icons.share, size: 26, color: AppColors.primaryColor),
                ],
              ),
              Row(
                children: [
                  Text(
                    "آية اليوم",
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star, size: 26, color: AppColors.primaryColor),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          Text(
            " أَلَمۡ یَأۡنِ لِلَّذِینَ ءَامَنُوۤا۟ أَن تَخۡشَعَ قُلُوبُهُمۡ لِذِكۡرِ ٱللَّهِ وَمَا نَزَلَ مِنَ ٱلۡحَقِّ وَلَا یَكُونُوا۟ كَٱلَّذِینَ أُوتُوا۟ ٱلۡكِتَـٰبَ مِن قَبۡلُ فَطَالَ عَلَیۡهِمُ ٱلۡأَمَدُ فَقَسَتۡ قُلُوبُهُمۡۖ وَكَثِیرࣱ مِّنۡهُمۡ فَـٰسِقُونَ﴾",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
