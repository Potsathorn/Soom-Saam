import 'dart:math' as math;
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:randint/utils/font.dart';
import 'package:randint/utils/language.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/admob_service.dart';
import '../utils/color.dart';
import '../utils/sound.dart';
import '../widget/dialod_app.dart';
import '../widget/drawer.dart';
import '../widget/flat_3d_button.dart';
import '../widget/reel.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  BannerAd? bannerAd;
  //declare variable
  List<RollerItem> _actualRollItems = [];
  bool isSpin = false;
  bool isPrint = false;
  bool firstPrint = true;
  bool printBy = false;
  bool init = true;
  bool stampDate = false;
  bool cutting = false;
  bool cutted = true;
  bool cutable = true;
  bool isRefresh = false;
  bool blink = false;
  bool showToast = false;

  late int digit1;
  late int digit2;
  late int digit3;
  late Timer timer;
  late Timer timer2;
  late Timer timer3;
  late Timer timerJackpot;

  final _scrollController1 = FixedExtentScrollController(initialItem: 0);
  final _scrollController2 = FixedExtentScrollController(initialItem: 0);
  final _scrollController3 = FixedExtentScrollController(initialItem: 0);
  final _screenshotController = ScreenshotController();

  int counter = 0;
  int counter2 = 0;
  int counter3 = 0;
  int goodWordIdx = 0;
  int colorIdx = 0;
  int gradientIdx = 0;

  double armTop = 74;
  double armLeft = 293;
  double ballArmTop = 55;
  double ballArmLeft = 287;
  double elevation = 5;
  double elevationW = 5;
  double paperWidth = 113;
  double paperHeight = 0;

  List<String> resultList = [];
  List<Color> bgGradient = [
    const Color(0xFF001A35),
    const Color(0xFF3E132C),
    const Color(0xFF1E1E1E),
  ];

  String dateNow = "";

  DateTime now = DateTime.now();
  Color jackpotColor = AppColor.colorPrimary;

  //sharedPreference
  String nameColorList = "day";
  String nameGradientList = "gradient";
  String goodWord = 'สบายใจ';
  Color machineColor = AppColor.colorPrimary[1]!;
  Color borderColor = AppColor.colorPrimary[1]!;
  bool soundOn = true;
  String lang = "English";

  int round = 0;
  List<int> d1 = [0, 2, 4, 0, 5, 1, 0, 2, 4, 0, 5, 1];
  List<int> d2 = [5, 5, 2, 0, 2, 9, 0, 2, 4, 0, 5, 1];
  List<int> d3 = [8, 0, 5, 7, 2, 6, 0, 2, 4, 0, 5, 1];

  late InAppWord _inAppWord;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    _prepareData();
    _input();
    _createBannerAd();

    digit1 = 0;
    digit2 = 0;
    digit3 = 0;

    elevation = elevationW;
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    bannerAd != null ? bannerAd!.dispose() : null;

    super.dispose();
  }

  Future<void> _prepareData() async {
    setState(() {
      isRefresh = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('lang') ?? 'English';
    goodWord = prefs.getString('goodWord') ?? 'Happy';
    nameColorList = prefs.getString('nameColorList') ?? 'day';
    colorIdx = prefs.getInt('colorIdx') ?? 0;
    nameGradientList = prefs.getString('nameGradientList') ?? 'gradient';
    gradientIdx = prefs.getInt('gradientIdx') ?? 0;
    soundOn = prefs.getBool('soundOn') ?? true;

    if (nameColorList == 'day') {
      machineColor = AppColor.day[colorIdx].color;
    } else if (nameColorList == 'noppaKao') {
      machineColor = AppColor.noppaKao[colorIdx].color;
    } else {
      machineColor = AppColor.thaiTone[colorIdx].color;
    }

    if (nameGradientList == 'gradient') {
      bgGradient = AppColor.gradientApp[gradientIdx].gradient;
    }

    log('${prefs.getString('goodWord')}');
    _inAppWord = Languages.inAppWord(lang);
    setState(() {
      isRefresh = false;
    });
  }

  void _input() {
    _actualRollItems = [];
    for (int i = 0; i < 10; i++) {
      _actualRollItems.add(RollerItem(
          child: Container(
              alignment: Alignment.center,
              child: Text(
                "$i",
                style: const TextStyle(
                  fontFamily: FontFamilly.numberSlot,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )),
          index: i));
    }
  }

  void _createBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.listener,
        request: const AdRequest())
      ..load();
  }

  void _init() {
    _scrollController1.animateToItem(
      0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    _scrollController2.animateToItem(
      0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    _scrollController3.animateToItem(
      0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );

    isSpin = false;
    isPrint = false;
    firstPrint = true;
    printBy = false;
    init = true;
    stampDate = false;
    cutting = false;
    cutable = true;
    cutted = true;
    resultList.clear();
    paperHeight = 0;

    setState(() {});
  }

  Future<void> _printting() async {
    SoundOn.print();
    firstPrint = true;

    cutted = false; //ปริ้นต์อยู่ถือว่าไม่ตัด
    paperHeight = 50;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 250), () {})
        .then((value) {
      resultList.add("$digit1$digit2$digit3");
      printBy = true;
      setState(() {});
    });
  }

  Future<void> _cutting() async {
    SoundOn.cut();
    cutable = false;
    paperHeight += 20;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 200), () {});
    final DateTime now = DateTime.now();
    final todayBuddhism = DateTime(now.year + 543, now.month, now.day);
    if (lang == "English") {
      dateNow = DateFormat('MM/dd/yyyy').format(now);
    } else {
      dateNow = DateFormat('dd/MM/yy').format(todayBuddhism);
    }

    //dateNow = "30/12/65"; //ล็อควันที่
    stampDate = true;
    setState(() {});
    await Future.delayed(const Duration(microseconds: 500), () {});
    cutting = true; //ตัดสุดขอบ
    setState(() {});
    await Future.delayed(const Duration(seconds: 1), () {}).then((value) {
      cutting = false; //ตัดเสร็จ
      setState(() {});
    });
    await Future.delayed(const Duration(seconds: 1), () {}).then((value) {
      cutted = true; //ปริ้นต์เสร็จถือว่าตัดแล้ว
      bool isHorizontal = paperWidth >= paperHeight;
      setState(() {});
      DialogApp(context).showAppDialog(
        childe:
            //resultDialog
            DialogApp(context).saveCapture(
                isEng: lang == "English",
                title: lang == "English" ? "Result" : "ผลการสุ่ม",
                middleText: lang == "English"
                    ? "Do you want to save the result?"
                    : "บันทึกภาพผลการสุ่ม",
                onTapCancel: () {
                  Navigator.pop(context);
                  _init();
                },
                onTapConfirm: () async {
                  Navigator.pop(context);
                  _showToast();
                  await _screenshotController
                      .captureFromWidget(Material(
                          child: _paperResult(
                              percent: 1,
                              height: paperHeight,
                              listData: resultList)))
                      .then((image) async {
                    await _saveImage(image);
                    return;
                  });

                  // ignore: use_build_context_synchronously

                  _init();
                },
                color: machineColor,
                dialogWidth: 324,
                dialogHeight: isHorizontal ? 342 : 426,
                paperWidth: isHorizontal ? 254 : 192,
                paperHeight: isHorizontal ? 158 : 248,
                child: _paperResult(
                    percent: 1, height: paperHeight, listData: resultList)),
      );
      setState(() {});
    });
  }

  Future<void> _showToast() async {
    setState(() {
      showToast = true;
    });
    await Future.delayed(const Duration(seconds: 1), () {});
    setState(() {
      showToast = false;
    });
  }

  Future<void> _jackpotStart() async {
    SoundOn.jackpot();

    timerJackpot = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        blink = !blink;
      });
    });

    await Future.delayed(const Duration(milliseconds: 2000), () {
      blink = false;
      _jackpotStop();
    });
  }

  Future<void> _jackpotStop() async {
    timerJackpot.cancel();
    setState(() {});
  }

  Future<void> _start() async {
    SoundOn.random();
    math.Random random = math.Random();
    int randomResult1 = 30 + random.nextInt(55 - 30);
    //min + _random.nextInt(max - min);

    timer = Timer.periodic(Duration(milliseconds: randomResult1), (timer) {
      _scrollController1.animateToItem(
        counter,
        duration: Duration(milliseconds: randomResult1),
        curve: Curves.linear,
      );
      counter--;
    });

    int randomResult2 = 30 + random.nextInt(55 - 30);
    timer2 = Timer.periodic(Duration(milliseconds: randomResult2), (timer) {
      _scrollController2.animateToItem(
        counter2,
        duration: Duration(milliseconds: randomResult2),
        curve: Curves.linear,
      );
      counter2++;
    });

    int randomResult3 = 30 + random.nextInt(55 - 30);
    timer3 = Timer.periodic(Duration(milliseconds: randomResult3), (timer) {
      _scrollController3.animateToItem(
        counter3,
        duration: Duration(milliseconds: randomResult3),
        curve: Curves.linear,
      );

      counter3--;
    });

    log("$randomResult1 $randomResult2 $randomResult3"); //ดูความเร็วการหมุนแต่ละวง
    armTop = 170;
    armLeft = 293;
    ballArmTop = 248;
    ballArmLeft = 287;

    setState(() {});
    await Future.delayed(const Duration(milliseconds: 1500), () {
      _stop();
    });
  }

  void _stop() {
    timer.cancel();
    timer2.cancel();
    timer3.cancel();
    // counter = d1[round]; //หวยล็อก
    // counter2 = d2[round];
    // counter3 = d3[round];
    // round++;
    // counter = 3; //หวยล็อก
    // counter2 = 2;
    // counter3 = 1;
    _scrollController1.animateToItem(
      counter,
      duration: const Duration(milliseconds: 350),
      curve: Curves.decelerate,
    );
    _scrollController2.animateToItem(
      counter2,
      duration: const Duration(milliseconds: 450),
      curve: Curves.decelerate,
    );
    _scrollController3
        .animateToItem(
      counter3,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    )
        .then((value) async {
      //วงสุดท้ายหยุดหมุน
      if ((digit2 == digit1 + 1 && digit3 == digit1 + 2) || // น้อยไปมาก
          (digit2 == digit3 + 1 && digit1 == digit3 + 2) || //มากไปน้อบ
          (digit1 == digit2 && digit1 == digit3)) {
        _jackpotStart();
      }

      if (resultList.any((element) => element == "$digit1$digit2$digit3")) {
        _start();
      } else {
        //หยุดหมุน
        isSpin = false;
        if (isPrint) {
          SoundOn.print();
          paperHeight += 20;
          setState(() {});
          await Future.delayed(const Duration(milliseconds: 200), () {});

          log("$digit1$digit2$digit3");
          resultList.add("$digit1$digit2$digit3");

          setState(() {});
        }
      }
      return;
    });

    armTop = 74;
    armLeft = 293;
    ballArmTop = 55;
    ballArmLeft = 287;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: !isRefresh
          ? Scaffold(
              appBar: AppBar(
                backgroundColor: machineColor,
                title: _appbar(context),
                actions: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.settings, size: 30),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              ),
              endDrawer: _drawer(),
              body: _body(),
            )
          : _screenPrepareData(),
    );
  }

  Widget _appbar(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        // height: 70,
        alignment: Alignment.centerLeft,
        color: machineColor,
        child: Text(
          _inAppWord.appName!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamilly.kanit,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      );

  Widget _drawer() => SoomSaamDrawer(
        goodWord: (idx, goodword) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("goodWord", goodword);
          log('${prefs.getString('goodWord')}');
          goodWordIdx = idx;
          goodWord = goodword;
          // goodWord = lang == "English"
          //     ? AppColor.goodWordEng[idx]
          //     : AppColor.goodWord[idx];
          setState(() {});
        },
        gradient: (name, gradient, idx) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("nameGradientList", name);
          await prefs.setInt("gradientIdx", idx);
          log('${prefs.getString('nameGradientList')} ${prefs.getInt('gradientIdx')}');
          bgGradient = gradient;
          nameGradientList = name;
          gradientIdx = idx;
          setState(() {});
        },
        machineColor: (name, machineColorResult, idx) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("nameColorList", name);
          await prefs.setInt("colorIdx", idx);
          log('${prefs.getString('nameColorList')} ${prefs.getInt('colorIdx')}');
          machineColor = machineColorResult;
          nameColorList = name;
          colorIdx = idx;

          setState(() {});
        },
        goodWordSelected: goodWord,
        gradientSelected: bgGradient,
        machineColorSelected: machineColor,
        nameMachineColorSelected: nameColorList,
        indexColorList: colorIdx,
        indexGadientList: gradientIdx,
        nameGradientSelected: nameGradientList,
        inAppWord: _inAppWord,
        languageSelected: (langSelected) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("lang", langSelected);
          lang = langSelected;
          _inAppWord = Languages.inAppWord(lang);
          goodWord = lang == "English" ? "Happy" : "พูนสุข";
          await prefs.setString("goodWord", goodWord);

          setState(() {});
        },
        goodWordList:
            lang == "English" ? AppColor.goodWordEng : AppColor.goodWord,
      );

  Widget _body() => Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: bgGradient,
          // colors: [
          //   Colors.black,
          //   Colors.pinkAccent[700]!,
          //   Colors.white,
          //   Colors.pinkAccent[700]!,
          //   Colors.black,
          // ]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child:
                bannerAd != null ? AdWidget(ad: bannerAd!) : const SizedBox(),
          ),
          Expanded(
            child: Center(
                child: _slotMachine(
                    machineColor: machineColor,
                    borderColor: nameColorList == 'day' && colorIdx == 1
                        ? AppColor.buttonSlot[2]!
                        : Colors.yellowAccent[700]!,
                    printButtonColor: AppColor.buttonSlot[3]!,
                    randomButtonColor: AppColor.buttonSlot[2]!,
                    soundButtonColor: AppColor.buttonSlot[5]!)),
          ),
        ],
      ));

  Widget _screenPrepareData() => Scaffold(
      backgroundColor: AppColor.backgroundApp,
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        child: Image.asset(
          "assets/icon/iconApp_transparentV2.png",
          fit: BoxFit.contain,
        ),
      )));

  Widget _jackpotIcon(
          {required double top,
          required double left,
          IconData? icon,
          Color? color,
          double? size}) =>
      Positioned(
          top: top,
          left: left,
          child: blink
              ? Icon(icon ?? Icons.star,
                  size: size ?? 30, color: color ?? jackpotColor)
              : const SizedBox());
  Widget _jackpotText(
          {required double top,
          required double left,
          String? text,
          Color? color,
          double? size}) =>
      Positioned(
          top: top,
          left: left,
          child: blink
              ? Text(
                  text ?? "",
                  style: TextStyle(
                      fontSize: size,
                      fontFamily: FontFamilly.kanit,
                      color: color),
                )
              : const SizedBox());

  Widget _slotMachine(
      {Color machineColor = AppColor.colorWhite,
      Color borderColor = AppColor.colorWhite,
      Color printButtonColor = AppColor.colorWhite,
      Color randomButtonColor = AppColor.colorWhite,
      Color soundButtonColor = AppColor.colorWhite}) {
    List<Color> gradientArm = [
      const Color(0xFFD3841D),
      const Color(0xFFFACB3B),
      const Color(0xFFF3A22F),
      const Color(0xFFFECC40),
      const Color(0xFFF7A521),
    ];

    return SizedBox(
      width: 323,
      height: 357 + 60, //บวกเผื่อ ads
      child: Stack(clipBehavior: Clip.none, children: [
        for (int i = 0; i < 20; i++)
          _jackpotIcon(
              color: AppColor
                  .day[math.Random().nextInt(AppColor.day.length - 1)].color,
              top: (-500 + math.Random().nextInt(1000)).toDouble(),
              left: (-50 + math.Random().nextInt(500)).toDouble()),
        // for (int i = 0; i < 5; i++)
        //   _jackpotText(
        //       color: AppColor
        //           .day[math.Random().nextInt(AppColor.day.length - 1)].color,
        //       top: (-500 + math.Random().nextInt(1000)).toDouble(),
        //       left: (-50 + math.Random().nextInt(500)).toDouble(),
        //       text: "$digit1$digit2$digit3",
        //       size: 16 + math.Random().nextInt(50 - 16).toDouble()),
        // for (int i = 0; i < 5; i++)
        //   _jackpotText(
        //       color: AppColor
        //           .day[math.Random().nextInt(AppColor.day.length - 1)].color,
        //       top: (-500 + math.Random().nextInt(1000)).toDouble(),
        //       left: (-50 + math.Random().nextInt(500)).toDouble(),
        //       text: digit1 == digit2 && digit1 == digit3 ? "ตอง" : "เรียง",
        //       size: 16 + math.Random().nextInt(50 - 16).toDouble()),

        Positioned(
            top: 88,
            left: 76,
            child: Container(
              width: 168,
              height: 165,
              color: AppColor.colorPrimary[11],
              alignment: Alignment.center,
            )),
        Positioned(
          top: 105,
          left: 43,
          child: Container(
            width: 236,
            height: 112,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: borderColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              color: machineColor,
            ),
            alignment: Alignment.center,
            child: Container(
              width: 201,
              height: 85,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 3, color: machineColor.withOpacity(0.5)),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                color: AppColor.colorPrimary[3],
              ),
              alignment: Alignment.center,
              child: Container(
                width: 149,
                height: 66,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: machineColor),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  color: machineColor.withOpacity(0.5),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _rollSlot(_scrollController1, 1),
                    _rollSlot(_scrollController2, 2),
                    _rollSlot(_scrollController3, 3),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 150,
            left: 278,
            child: Container(
              width: 13,
              height: 24,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientArm,
                ),
                // border: Border.all(width: 2, color: const Color(0xFFF8C73C)),
                borderRadius: const BorderRadius.all(Radius.circular(2.0)),
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: 153,
            left: 291,
            child: Container(
              width: 12,
              height: 18,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientArm,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                color: Colors.white,
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: armTop,
            left: armLeft,
            child: Container(
              width: 9,
              height: 79,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xFFF9C643)),
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                color: const Color(0xFFFBCC45),
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: ballArmTop,
            left: ballArmLeft,
            child: Container(
              width: 21,
              height: 21,
              decoration: BoxDecoration(
                gradient: const RadialGradient(
                  // center: Alignment(0.7, -0.6), // near the top right
                  radius: 0.5,
                  colors: <Color>[
                    Color(0xFFFFFFFF),
                    Color(0xFFFF0000), // yellow sun
                    // blue sky
                  ],
                  //  stops: <double>[0.4, 1.0],
                ),
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: const Color(0xFFFF0000)),
                // color: Colors.white,
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: 223,
            left: 33,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [.5, .5],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    AppColor.colorPrimary[9]!,
                    Colors.transparent, // top Right part
                  ],
                ),
              ),
            )),
        Positioned(
            top: 223,
            left: 77,
            child: Container(
              width: 165,
              height: 46,
              decoration: BoxDecoration(
                //border: Border.all(width: 3, color: Colors.black),
                //borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                color: AppColor.colorPrimary[9]!,
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: 223,
            left: 241,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [.5, .5],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColor.colorPrimary[9]!,
                    Colors.transparent, // top Right part
                  ],
                ),
              ),
            )),
        Positioned(
            top: 269,
            left: 33,
            child: Container(
              width: 254,
              height: 59,
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: g3,
                // ),
                border: Border.all(width: 3, color: borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                color: machineColor,
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: 61,
            left: 68,
            child: Container(
              width: 186,
              height: 37,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                color: machineColor,
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: 288,
            left: 81,
            child: Container(
              width: 159,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                color: AppColor.colorPrimary[12],
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: 75,
            left: 90,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 2, color: borderColor.withOpacity(0.1)),
                color: borderColor,
              ),
              alignment: Alignment.center,
            )),
        Positioned(
            top: 75,
            left: 226,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 2, color: borderColor.withOpacity(0.1)),
                color: borderColor,
              ),
              alignment: Alignment.center,
            )),
        Positioned(
          top: 21,
          left: 106,
          child: MyArc(
            diameter: 114,
            color: borderColor,
          ),
        ),
        Positioned(
          top: 26,
          left: 111,
          child: MyArc(diameter: 105, color: machineColor),
        ),
        Positioned(
          top: 37,
          left: 122,
          child: MyArc(diameter: 83, color: AppColor.colorGrey[4]!),
        ),
        Positioned(
          //คำเปรย
          top: 45,
          left: 134,
          child: Container(
            width: 60,
            height: 30,
            alignment: Alignment.center,
            child: AutoSizeText(
              goodWord,
              maxLines: 1,
              minFontSize: 10,
              style: TextStyle(
                // letterSpacing: 0.5,
                fontFamily: FontFamilly.kanit,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: machineColor,
              ),
            ),
          ),
        ),
        Positioned(
          top: 228,
          left: 133,
          child: CustomFlat3dButton(
              //ปุ่มสุ่ม
              // enable: !isSpin,
              onTap: (() {
                if (!isSpin) {
                  init = false;
                  isSpin = true;
                  firstPrint = false;
                  cutted = false;
                  _start();
                }
              }),
              width: 57,
              height: 30,
              color: randomButtonColor,
              shadowColor: AppColor.colorBlack.withOpacity(0.5),
              //shadowColor: AppColor.colorStatusTag,
              child: Text(
                _inAppWord.randomButton!,
                style: TextStyle(
                    fontFamily: FontFamilly.kanit,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.colorWhite),
              )),
        ),
        Positioned(
          //ปุ่มเสียง
          top: 228,
          left: 204,
          child: CustomFlat3dButton(
              onTap: (() async {
                soundOn = !soundOn;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool("soundOn", soundOn);
                setState(() {});
              }),
              width: 32,
              height: 30,
              color: soundButtonColor,
              shadowColor: AppColor.colorBlack.withOpacity(0.5),
              child: Icon(
                soundOn ? Icons.volume_up : Icons.volume_off,
                color: AppColor.colorWhite,
                size: 18,
              )),
        ),
        Positioned(
          //ปุ่มปริ้นต์
          top: 228,
          left: 87,
          child: CustomFlat3dButton(
              enable: !init,
              onTap: (() {
                if (!init && !isSpin && cutable) {
                  isPrint = !isPrint;
                  isPrint ? _printting() : _cutting();
                }
                setState(() {});
              }),
              width: 32,
              height: 30,
              color: init ? AppColor.colorText[1]! : printButtonColor,
              shadowColor: init
                  ? AppColor.colorGrey[0]!
                  : AppColor.colorBlack.withOpacity(0.5),
              child: Icon(
                !isPrint ? Icons.print : Icons.content_cut_sharp,
                color: init ? AppColor.colorGrey[0]! : AppColor.colorWhite,
                size: 18,
              )),
        ),
        // if (isPrint)
        if (!cutted) //ตัดแล้วไม่Show
          Positioned(
              //กระดาษ
              top: 298,
              left: 104,
              // duration: const Duration(seconds: 1),
              // curve: Curves.linear,
              child: _paperAnimated(width: paperWidth)),
        AnimatedPositioned(
          //ตัวตัด
          left: cutting ? 223 : 88,
          top: 293,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
          // child: Icon(
          //   Icons.cut_outlined,
          //   size: 10,
          //   color: !cutting ? AppColor.colorPrimary[12] : AppColor.colorGrey[1],
          // ),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              shape: BoxShape.circle,
              color: AppColor.colorGrey[2]!,
            ),
          ),
        ),
        //if (showToast)
        Positioned(
            top: 352,
            left: 58,
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: showToast
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        color: AppColor.colorBlack.withOpacity(0.7),
                      ),
                      width: 206,
                      child: const Text(
                        'บันทึกผลการสุ่มเรียบร้อย',
                        style: TextStyle(
                            fontFamily: FontFamilly.kanit,
                            fontSize: 16,
                            color: AppColor.colorWhite),
                      ),
                    )
                  : const SizedBox(),
            ))
      ]),
    );
  }

  Widget _rollSlot(ScrollController controller, int digit) => Container(
        width: 40,
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // border: Border.all(width: 3, color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          color: AppColor.colorPrimary[6],
        ),
        child: Container(
          width: 40,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // border: Border.all(width: 3, color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            color: AppColor.colorPrimary[7],
          ),
          child: _slot(controller, digit),
        ),
      );

  Widget _slot(ScrollController controller, int digit) {
    return ListWheelScrollView.useDelegate(
      onSelectedItemChanged: (index) {
        setState(() {
          if (digit == 1) {
            digit1 = index;
          } else if (digit == 2) {
            digit2 = index;
          } else {
            digit3 = index;
          }
        });
      },
      controller: controller,
      itemExtent: 48,
      useMagnifier: true,
      physics: const FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildLoopingListDelegate(
        children: _actualRollItems.map<Widget>((item) {
          return SizedBox(
            width: 40,
            height: 46,
            child: item.child,
          );
        }).toList(),
      ),
    );
  }

  Widget _paperResult(
      {double width = 113,
      double percent = 1,
      double height = 70,
      List<String> listData = const []}) {
    List<String> reversedList = listData.reversed.toList();

    return Container(
      width: width * percent,
      height: height * percent,
      decoration: BoxDecoration(
        border: Border.all(width: 1 * percent, color: AppColor.paper[1]!),
        color: AppColor.paper,
      ),
      alignment: Alignment.bottomCenter,
      child: Column(children: [
        // if (stampDate) //เวลา
        Container(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          width: width * percent,
          height: 20 * percent,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1 + percent, color: AppColor.paper[2]!))),
          child: Text(
            dateNow,
            textAlign: TextAlign.center,
            style: TextStyle(
                //letterSpacing: 5,
                height: 0.77,
                fontFamily: FontFamilly.lineMue,
                fontSize: 30 * percent,
                fontWeight: FontWeight.bold,
                color: AppColor.paper[3]!),
          ),
        ),

        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  width: width * percent,
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1 * percent, color: AppColor.paper[2]!))),
                  child: Text(
                    reversedList[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        //letterSpacing: 5,
                        height: 0.77,
                        fontFamily: FontFamilly.lineMue,
                        fontSize: 30 * percent,
                        fontWeight: FontWeight.bold,
                        color: AppColor.paper[3]!),
                  ),
                );
              }),
        ),
        // for (var data in result.reversed) //ข้อมูล
        //   Container(
        //     padding: EdgeInsets.zero,
        //     alignment: Alignment.center,
        //     width: width * percent,
        //     height: 20 * percent,
        //     decoration: BoxDecoration(
        //         border: Border(
        //             bottom: BorderSide(
        //                 width: 1 * percent, color: AppColor.paper[2]!))),
        //     child: Text(
        //       data,
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //           //letterSpacing: 5,
        //           height: 0.77,
        //           fontFamily: FontFamilly.lineMue,
        //           fontSize: 30 * percent,
        //           fontWeight: FontWeight.bold,
        //           color: AppColor.paper[3]!),
        //     ),
        //   ),
        // if (printBy)
        Container(
          //ปริ้นต์โดย
          padding: EdgeInsets.zero,
          alignment: Alignment.centerRight,
          width: width,
          // height: 20,
          // decoration: BoxDecoration(
          //     border: Border(
          //         top:
          //             BorderSide(width: 0, color: AppColor.paper[2]!))),
          child: Text(
            "$goodWord  ",
            textAlign: TextAlign.center,
            style: TextStyle(
                // height: 1.5,
                fontFamily: FontFamilly.lineMue,
                fontSize: 18 * percent,
                fontWeight: FontWeight.bold,
                color: AppColor.paper[3]!),
          ),
        )
      ]),
    );
  }

  Widget _paperAnimated({double width = 113}) => AnimatedContainer(
        width: width,
        height: paperHeight,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.paper[1]!),
          color: AppColor.paper,
        ),
        alignment: Alignment.bottomCenter,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        child: Column(children: [
          if (stampDate) //เวลา
            Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              width: width,
              height: 20,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColor.paper[2]!))),
              child: Text(
                dateNow,
                textAlign: TextAlign.center,
                style: TextStyle(
                    //letterSpacing: 5,
                    height: 0.77,
                    fontFamily: FontFamilly.lineMue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.paper[3]!),
              ),
            ),
          for (var data in resultList.reversed) //ข้อมูล
            Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              width: width,
              height: 20,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColor.paper[2]!))),
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(
                    //letterSpacing: 5,
                    height: 0.77,
                    fontFamily: FontFamilly.lineMue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.paper[3]!),
              ),
            ),
          if (printBy)
            Container(
              //ปริ้นต์โดย
              padding: EdgeInsets.zero,
              alignment: Alignment.centerRight,
              width: width,
              child: AutoSizeText(
                "$goodWord  ",
                textAlign: TextAlign.center,
                maxLines: 1,
                minFontSize: 10,
                style: TextStyle(
                    // height: 1.5,
                    fontFamily: FontFamilly.lineMue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.paper[3]!),
              ),
            )
        ]),
      );

  Future<String> _saveImage(Uint8List image) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '')
        .replaceAll(':', '')
        .replaceAll('-', '');

    final name = 'SoomSaam_$time';
    final result = await ImageGallerySaver.saveImage(image, name: name);
    return result['filePath'];
  }
}

class MyArc extends StatelessWidget {
  final double diameter;
  final Color color;

  const MyArc({super.key, this.diameter = 200, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(color: color),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final Color color;

  const MyPainter({this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
