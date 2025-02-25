import 'package:flutter/material.dart';
import 'package:koran_app/presentation/widgets/custom_app_bar.dart';
import 'package:koran_app/utils/colors.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _count = 0;
  int _countTasbeeh = 0;
  final List<String> _tasbeeh = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "التسبيح", hideIcon: true),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _tasbeeh[_countTasbeeh],
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "عدد التسبيحات",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Text(
                _count.toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 40),
              IconButton(
                onPressed: () {
                  setState(() {
                    _count += 1;
                    if (_count == 34) {
                      _countTasbeeh++;
                      if (_countTasbeeh >= _tasbeeh.length) {
                        _countTasbeeh = 0;
                      }
                      _count = 0;
                    }
                  });
                },
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.textColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                icon: Icon(Icons.fingerprint, size: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
