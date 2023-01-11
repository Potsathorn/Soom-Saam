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
      MaterialColor(0xFF001D26, <int, Color>{});

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

  // static List<NameColor> day = [
  //   NameColor(color: const Color(0xFFB20F09), name: 'อาทิตย์'),
  //   NameColor(color: const Color(0xFFE49C02), name: 'จันทร์'),
  //   NameColor(color: const Color(0xFFF798A9), name: 'อังคาร'),
  //   NameColor(color: const Color(0xFF03492C), name: 'พุธ'),
  //   NameColor(color: const Color(0xFFDD6003), name: 'พฤหัสบดี'),
  //   NameColor(color: const Color(0xFF023D94), name: 'ศุกร์'),
  //   NameColor(color: const Color(0xFF4F2460), name: 'เสาร์'),
  // ];

  static List<NameColor> day = [
    NameColor(color: Colors.redAccent[700]!, name: 'อาทิตย์'),
    NameColor(color: Colors.yellowAccent[700]!, name: 'จันทร์'),
    NameColor(color: Colors.pinkAccent[700]!, name: 'อังคาร'),
    NameColor(color: Colors.greenAccent[700]!, name: 'พุธ'),
    NameColor(color: Colors.orangeAccent[700]!, name: 'พฤหัสบดี'),
    NameColor(color: Colors.cyanAccent[700]!, name: 'ศุกร์'),
    NameColor(color: Colors.purpleAccent[700]!, name: 'เสาร์'),
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

  // static List<NameGradient> gradientApp = [
  //   NameGradient(
  //       gradient: [Colors.black, Colors.red[900]!, Colors.black],
  //       name: 'Premium Dark'),

  //   NameGradient(gradient: [
  //     Colors.black,
  //     Colors.pinkAccent[700]!,
  //     Colors.white,
  //     Colors.pinkAccent[700]!,
  //     Colors.black,
  //   ], name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.purple[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.deepPurple[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.indigo[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.blue[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.lightBlue[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.cyan[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.teal[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.green[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.lightGreen[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.lime[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.yellow[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.amber[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.orange[900]!, Colors.black],
  //       name: 'Premium Dark'),
  //   NameGradient(
  //       gradient: [Colors.black, Colors.deepOrange[900]!, Colors.black],
  //       name: 'Premium Dark'),
  // ];

  static List<NameGradient> gradientApp = [
    NameGradient(gradient: [
      const Color(0xFFFAFAFA),
      const Color(0xFFFAFAFA),
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.redAccent[700]!,
      Colors.white,
      Colors.redAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.pinkAccent[700]!,
      Colors.white,
      Colors.pinkAccent[700]!,
      Colors.black,
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.purpleAccent[700]!,
      Colors.white,
      Colors.purpleAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.deepPurpleAccent[700]!,
      Colors.white,
      Colors.deepPurpleAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.indigoAccent[700]!,
      Colors.white,
      Colors.indigoAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.blueAccent[700]!,
      Colors.white,
      Colors.blueAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.lightBlueAccent[700]!,
      Colors.white,
      Colors.lightBlueAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.cyanAccent[700]!,
      Colors.white,
      Colors.cyanAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.tealAccent[700]!,
      Colors.white,
      Colors.tealAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.greenAccent[700]!,
      Colors.white,
      Colors.greenAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.lightGreenAccent[700]!,
      Colors.white,
      Colors.lightGreenAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.limeAccent[700]!,
      Colors.white,
      Colors.limeAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.yellowAccent[700]!,
      Colors.white,
      Colors.yellowAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.amberAccent[700]!,
      Colors.white,
      Colors.amberAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.orangeAccent[700]!,
      Colors.white,
      Colors.orangeAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
    NameGradient(gradient: [
      Colors.black,
      Colors.deepOrangeAccent[700]!,
      Colors.white,
      Colors.deepOrangeAccent[700]!,
      Colors.black
    ], name: 'Premium Dark'),
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
