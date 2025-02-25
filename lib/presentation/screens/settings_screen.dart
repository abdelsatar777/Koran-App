import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD580),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              children: [
                const Text(
                  "الملف الشخصي",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/img/profile.png"),
                ),
                const SizedBox(height: 10),
                const Text(
                  "ضيف",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SettingsOption(icon: Icons.edit, text: "تعديل الملف الشخصي"),
          Divider(),
          SettingsOption(icon: Icons.stars, text: "عدد النقاط"),
          Divider(),
          SettingsOption(icon: Icons.bookmark, text: "المحفوظ"),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B4513),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 10),
                  Text("تسجيل الخروج", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String text;

  const SettingsOption({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: 10),
          Icon(icon, color: Colors.brown),
        ],
      ),
    );
  }
}
