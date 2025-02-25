import 'package:flutter/material.dart';
import 'package:koran_app/models/khotab_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';

class CustomKhotabCard extends StatelessWidget {
  final KhotabModel khotabModel;

  const CustomKhotabCard({super.key, required this.khotabModel});

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
            khotabModel.title,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            khotabModel.description,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final Uri url = Uri.parse(khotabModel.url[0]["url"]);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("لا يمكن فتح الرابط: ${khotabModel.url}"),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 18),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Text("قراءة الخطبة"),
          ),
        ],
      ),
    );
  }
}
