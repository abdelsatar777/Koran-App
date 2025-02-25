import 'package:flutter/material.dart';
import '../../models/hadiths_model.dart';
import '../../utils/colors.dart';

class CustomHadithCard extends StatelessWidget {
  final HadithsModel hadithsModel;

  const CustomHadithCard({super.key, required this.hadithsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "الحديث ${hadithsModel.hadithNumber}",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            hadithsModel.hadith,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
