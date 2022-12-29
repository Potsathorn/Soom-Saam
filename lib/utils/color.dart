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
