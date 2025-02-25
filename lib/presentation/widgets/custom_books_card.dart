import 'package:flutter/material.dart';
import 'package:koran_app/models/books_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';

class CustomBooksCard extends StatelessWidget {
  final BooksModel booksModel;

  const CustomBooksCard({super.key, required this.booksModel});

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
            booksModel.title,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            booksModel.description,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final Uri url = Uri.parse(booksModel.url[0]["url"]);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("لا يمكن فتح الرابط: ${booksModel.url}"),
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
            child: Text("قراءة الكتاب"),
          ),
        ],
      ),
    );
  }
}
