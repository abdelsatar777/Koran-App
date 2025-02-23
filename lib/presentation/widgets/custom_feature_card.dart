import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomFeatureCard extends StatelessWidget {
  final String title;
  final String icon;
  final Widget targetPage;

  const CustomFeatureCard({
    super.key,
    required this.title,
    required this.icon,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => targetPage,
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ImageIcon(AssetImage(icon), size: 40, color: Colors.white),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: AppColors.textColor,
          ),
        )
      ],
    );
  }
}
