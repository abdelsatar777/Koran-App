import 'package:flutter/material.dart';
import 'package:koran_app/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hideIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hideIcon = false, // القيمة الافتراضية: الأيقونة ظاهرة
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text(title),
      titleTextStyle: const TextStyle(fontSize: 26, color: Colors.white),
      leading: hideIcon
          ? null // إخفاء الأيقونة إذا كان hideIcon = true
          : IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
