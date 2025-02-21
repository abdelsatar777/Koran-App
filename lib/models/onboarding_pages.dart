class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage(
      {required this.title, required this.description, required this.image});
}

final List<OnboardingPage> onboardingPages = [
  OnboardingPage(
    title: "مرحباً!",
    description: "ابدأ رحلتك في حفظ القرآن بسهولة وبالوتيرة التي تناسبك.",
    image: "assets/img/sc1.png",
  ),
  OnboardingPage(
    title: "خطط مخصصة",
    description: "ضع أهدافك الخاصة وتلقَّ تذكيرات مخصصة لتبقى على المسار.",
    image: "assets/img/sc2.png",
  ),
  OnboardingPage(
    title: "حافظ على التحفيز",
    description: "استلم تذكيرات يومية وآيات ملهمة تبقيك متصلاً بالقرآن.",
    image: "assets/img/sc3.png",
  ),
];
