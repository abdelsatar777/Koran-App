import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomVideoCard extends StatelessWidget {
  final String title;
  final String? description;
  final List<String> lessons;
  final ValueChanged<String?>? onLessonSelected;

  const CustomVideoCard({
    super.key,
    required this.title,
    this.description,
    required this.lessons,
    this.onLessonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // العنوان
            Text(
              title,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 8),
            // الوصف
            Text(
              description ?? "لا يوجد وصف",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            // القائمة المنسدلة لاختيار الدرس
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              hint: const Text(
                "اختر الدرس",
                style: TextStyle(
                  color: AppColors.textColor,
                ),
              ),
              items: lessons.map((lesson) {
                return DropdownMenuItem(
                  value: lesson,
                  child: Text(lesson),
                );
              }).toList(),
              onChanged: onLessonSelected,
            ),
          ],
        ),
      ),
    );
  }
}
