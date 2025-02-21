import 'package:flutter/material.dart';

import '../presentation/widgets/custom_text_field.dart';
import '../utils/colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true; // التحكم في عرض صفحة تسجيل الدخول أو إنشاء الحساب
  bool agreeToTerms = false; // للتحقق من الموافقة على الشروط

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF522700), Color(0xFFA85000)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Text(
                "القرآن الكريم",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // ضروري حتى يظهر التدرج
                ),
              ),
            ),
            const SizedBox(height: 26),
            const Text(
              "قم بتسجيل الدخول أو إنشاء حساب جديد لحفظ تقدمك",
              style: TextStyle(fontSize: 20, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 26),

            // زر التبديل بين تسجيل الدخول وإنشاء الحساب
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildToggleButton("إنشاء حساب", !isLogin),
                  _buildToggleButton("تسجيل الدخول", isLogin),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // فورم تسجيل الدخول أو إنشاء الحساب
            if (isLogin) _buildLoginForm() else _buildSignUpForm(),

            const SizedBox(height: 60),

            // زر تسجيل الدخول أو إنشاء الحساب
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.textColor,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 18),
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 130),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(isLogin ? "تسجيل الدخول" : "إنشاء حساب"),
            ),

            const SizedBox(height: 50),

            // خيارات تسجيل الدخول الأخرى
            const Text("خيارات تسجيل الدخول الأخرى",
                style: TextStyle(color: Colors.black)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton("assets/img/facebook-logo.png"),
                const SizedBox(width: 20),
                _buildSocialButton("assets/img/google-logo.png"),
                const SizedBox(width: 20),
                _buildSocialButton("assets/img/apple-logo.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // بناء زر التبديل بين تسجيل الدخول وإنشاء الحساب
  Widget _buildToggleButton(String text, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isLogin = text == "تسجيل الدخول"),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isActive ? Colors.white : const Color(0xFFEFEFEF),
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.textColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // فورم تسجيل الدخول
  Widget _buildLoginForm() {
    return Column(
      children: [
        CustomTextField(
          hint: "ادخل بريدك الإلكتروني",
          label: "البريد الإلكتروني",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: "ادخل كلمة المرور",
          label: "كلمة المرور",
          obscureText: true,
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {}, // إضافة إجراء نسيان كلمة المرور
            child: const Text(
              "نسيت كلمة المرور؟",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // فورم إنشاء الحساب
  Widget _buildSignUpForm() {
    return Column(
      children: [
        CustomTextField(
          hint: "ادخل بريدك الإلكتروني",
          label: "البريد الإلكتروني",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: "ادخل كلمة المرور",
          label: "كلمة المرور",
          obscureText: true,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: "أعد إدخال كلمة المرور",
          label: "تأكيد كلمة المرور",
          obscureText: true,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              child: Text(
                "أوافق على شروط خدمة المنصة وسياسة الخصوصية",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Checkbox(
              value: agreeToTerms,
              onChanged: (value) =>
                  setState(() => agreeToTerms = value ?? false),
              activeColor: AppColors.primaryColor,
            ),
          ],
        ),
      ],
    );
  }

  // زر تسجيل الدخول باستخدام وسائل التواصل الاجتماعي
  Widget _buildSocialButton(String assetPath) {
    return GestureDetector(
      onTap: () {}, // إضافة حدث تسجيل الدخول
      child: Image.asset(assetPath, width: 40),
    );
  }
}
