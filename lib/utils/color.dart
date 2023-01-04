// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor colorPrimary =
      MaterialColor(0xFFBF0614, <int, Color>{
    0: Color(0xFFBF0614),
    1: Color(0xFFFBCC45),
    2: Color(0xFF6B0003),
    3: Color(0xFF050505),
    4: Color(0xFF680003),
    5: Color(0xFF620208),
    6: Color(0xFFD9D9D9),
    7: Color(0xFFF9FDFD),
    8: Color(0xFFFFDE7E),
    9: Color(0xFF564555),
    10: Color(0xFFBC0614),
    11: Color(0xFF30252D),
    12: Color(0xFF001A35),
    13: Color(0xFF670804),
    14: Color(0xFFF9C548),
    15: Color(0xFFFDC841),
    16: Color(0xFF4AAE51),
    17: Color(0xFF2295F0),
  });

  static const MaterialColor buttonSlot =
      MaterialColor(0xFFBF0614, <int, Color>{
    0: Color(0xFFBF0614),
    1: Color(0xFFFDC841),
    2: Color(0xFFF1A42E),
    3: Color(0xFF2295F0),
    4: Color(0xFF1A79D4),
    5: Color(0xFF4AAE51),
    6: Color(0xFF319039),
  });

  static const MaterialColor backgroundApp =
      MaterialColor(0xFF001837, <int, Color>{});

  static const MaterialColor paper = MaterialColor(0xFFF9FDFD, <int, Color>{
    0: Color(0xFFF9FDFD),
    1: Color(0xFFB8B8B8),
    2: Color(0xFFB4D2EC),
    3: Color(0xFF00008B),
    4: Color(0xFF1A79D4),
    5: Color(0xFF4AAE51),
    6: Color(0xFF319039),
  });

  static const int _redPrimaryValue = 0xFFF44336;
  static const Color red500 = Color(_redPrimaryValue);

  static const MaterialColor colorText = MaterialColor(0xFF161616, <int, Color>{
    0: Color(0xFF161616),
    1: Color(0xFF404040),
    2: Color(0xFF454545),
    3: Color(0xFF707070),
    4: Color(0xFFDFDDDD),
    5: Color(0xFFFFFFFF),
    6: Color(0xFF333333),
    7: Color(0xFF575757)
  });

  static const MaterialColor colorIconDrawer =
      MaterialColor(0xFFb43330, <int, Color>{
    0: Color(0xFFC42128),
    1: Color(0xFFDC6909),
    2: Color(0xFFFFBE00),
    3: Color(0xFF09DC6A),
    4: Color(0xFF097edc),
    5: Color(0xFF512E5F),
  });

  static const MaterialColor colorWhite =
      MaterialColor(0xFFFFFFFF, <int, Color>{
    0: Color(0xFFFFFFFF),
  });

  static const MaterialColor colorGrey = MaterialColor(0xFF707070, <int, Color>{
    0: Color(0xFF707070),
    1: Color(0xFFCCCCCC),
    2: Color(0xFFDBDBDB),
    3: Color(0xFFF1F1F1),
    4: Color(0xFFEBEBEB),
  });

  static const MaterialColor colorBlack =
      MaterialColor(0xFF161616, <int, Color>{
    0: Color(0xFF161616),
    1: Color(0xFF333333),
  });

  static const MaterialColor colorStatusTag =
      MaterialColor(0xFFb43330, <int, Color>{
    0: Color(0xFFCCCCCC),
    1: Color(0xFF404040),
    2: Color(0xFFFFBE00),
    3: Color(0xFFDC6909),
    4: Color(0xFFC42128),
    5: Color(0xFF097CDC),
    6: Color(0xFF09DC6A),
  });

  static const LinearGradient gradientPrimary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF89625),
      Color(0xFFF3591F),
      Color(0xFFF03366),
    ],
    tileMode: TileMode.mirror,
  );

  static List<NameColor> day = [
    NameColor(color: const Color(0xFFB20F09), name: 'อาทิตย์'),
    NameColor(color: const Color(0xFFE49C02), name: 'จันทร์'),
    NameColor(color: const Color(0xFFF798A9), name: 'อังคาร'),
    NameColor(color: const Color(0xFF03492C), name: 'พุธ'),
    NameColor(color: const Color(0xFFDD6003), name: 'พฤหัสบดี'),
    NameColor(color: const Color(0xFF023D94), name: 'ศุกร์'),
    NameColor(color: const Color(0xFF4F2460), name: 'เสาร์'),
  ];

  static List<NameColor> thaiTone = [
    NameColor(color: const Color(0xFF1C3F67), name: 'คราม'),
    NameColor(color: const Color(0xFF00626B), name: 'เขียวขาม'),
    NameColor(color: const Color(0xFF007838), name: 'เขียวตอง'),
    NameColor(color: const Color(0xFFC2B506), name: 'เขียวมะพูด'),
    NameColor(color: const Color(0xFFF4BD00), name: 'รงทอง'),
    NameColor(color: const Color(0xFFF6A400), name: 'จำปา'),
    NameColor(color: const Color(0xFFF08525), name: 'เมฆสนทยา'),
    NameColor(color: const Color(0xFFE94D10), name: 'เสน'),
    NameColor(color: const Color(0xFFC3191C), name: 'แดงชาด'),
    NameColor(color: const Color(0xFFA42140), name: 'ลิ้นจี่'),
    NameColor(color: const Color(0xFF702874), name: 'เม็ดมะปราง'),
    NameColor(color: const Color(0xFF6A4797), name: 'ดอกอัญชัน'),
  ];

  static List<NameColor> noppaKao = [
    NameColor(color: const Color(0xFFCED7D0), name: 'เพชร'),
    NameColor(color: const Color(0xFFB12C2D), name: 'ทับทิม'),
    NameColor(color: const Color(0xFF017D41), name: 'มรกต'),
    NameColor(color: const Color(0xFFF1B600), name: 'บุษราคัม'),
    NameColor(color: const Color(0xFF9A1B38), name: 'โกเมน'),
    NameColor(color: const Color(0xFF173966), name: 'นิล'),
    NameColor(color: const Color(0xFFCAAC76), name: 'มุกดาหาร'),
    NameColor(color: const Color(0xFFD28897), name: 'เพทาย'),
    NameColor(color: const Color(0xFFD1C8A1), name: 'ไพฑูรย์'),
  ];

  static List<NameGradient> gradientApp = [
    NameGradient(
        gradient: [const Color(0xFFE9E4F0), const Color(0xFFD3CCE3)],
        name: 'Sexy Blue'),
    NameGradient(
        gradient: [const Color(0xFF41295a), const Color(0xFF2F0743)],
        name: 'Purple Love'),
    NameGradient(
        gradient: [const Color(0xFFDA22FF), const Color(0xFF9733EE)],
        name: 'Piglet'),
    NameGradient(gradient: [
      const Color(0xFF0F2027),
      const Color(0xFF203A43),
      const Color(0xFF2C5364)
    ], name: 'Mauve'),
    NameGradient(
        gradient: [const Color(0xFF000046), const Color(0xFF1CB5E0)],
        name: '50 Shades of Grey'),
    NameGradient(
        gradient: [const Color(0xFF000428), const Color(0xFF004e92)],
        name: 'Frost'),
    NameGradient(
        gradient: [const Color(0xFF00bf8f), const Color(0xFF001510)],
        name: 'Endless River'),
    NameGradient(
        gradient: [const Color(0xFF000000), const Color(0xFF0f9b0f)],
        name: 'Bloody Mary'),
    NameGradient(
        gradient: [const Color(0xFF11998e), const Color(0xFF38ef7d)],
        name: 'Decent'),
    NameGradient(gradient: [
      const Color(0xFF00416A),
      const Color(0xFF799F0C),
      const Color(0xFFFFE000)
    ], name: 'Aubergine'),
    NameGradient(
        gradient: [const Color(0xFFc21500), const Color(0xFFffc500)],
        name: 'Scooter'),
    NameGradient(
        gradient: [const Color(0xFFe65c00), const Color(0xFFF9D423)],
        name: 'Celestial'),
    NameGradient(
        gradient: [const Color(0xFFFF0099), const Color(0xFF000000)],
        name: 'Royal'),
    NameGradient(gradient: [
      const Color(0xFFfdeff9),
      const Color(0xFFec38bc),
      const Color(0xFF7303c0),
      const Color(0xFF03001e),
    ], name: 'Peach'),
    NameGradient(
        gradient: [const Color(0xFFdd1818), const Color(0xFF000000)],
        name: 'Heavy Rain'),
    NameGradient(
        gradient: [const Color(0xFF8E0E00), const Color(0xFF000000)],
        name: 'Premium Dark'),
  ];

  static const List<String> goodWord = [
    'สุขกาย',
    'สบายใจ',
    'โชคดี',
    'ร่ำรวย',
    'แข็งแรง',
    'มั่งมี',
    'รื่นรมย์',
    'มีสติ',
    'สงบสุข',
    'สมบูรณ์',
    'พูนสุข',
    'โชคลาภ',
    'ก้าวหน้า',
    'รุ่งเรื่อง',
    'สำเร็จ',
    'บริสุทธ์',
    'ราบรื่น',
    'ล้ำค่า',
    'สูงส่ง',
    'สมหวัง',
  ];
}

class NameColor {
  final String name;
  final Color color;
  NameColor({
    required this.name,
    required this.color,
  });
}

class NameGradient {
  final String name;
  final List<Color> gradient;
  NameGradient({
    required this.name,
    required this.gradient,
  });
}

TextStyle textThemeBody1(BuildContext context) {
  return Theme.of(context).textTheme.bodyText1!;
}

TextStyle textThemeBody2(BuildContext context) {
  return Theme.of(context).textTheme.bodyText2!;
}

TextStyle textThemeButton(BuildContext context) {
  return Theme.of(context).textTheme.button!;
}
