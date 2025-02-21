import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomFeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback onTap;

  const CustomFeatureCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
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
