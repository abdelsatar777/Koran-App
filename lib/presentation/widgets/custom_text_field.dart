import 'package:flutter/material.dart';
import 'package:koran_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          textAlign: TextAlign.right,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            hintText: hint,
            filled: false,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          ),
        ),
      ],
    );
  }
}
