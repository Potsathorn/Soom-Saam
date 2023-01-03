import 'dart:async';
import 'dart:developer';
import 'dart:math' as Math;
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:intl/intl.dart';
import 'package:randint/Widget/drawer.dart';
import 'package:randint/utils/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'ListWheelScrollView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Wheel(),
    );
  }
}

class Wheel extends StatefulWidget {
  const Wheel({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  //declare variable
  List<RollItem> _actualRollItems = [];
  bool isSpin = false;
  bool lastStop = true;
  bool isPrint = false;
  bool firstPrint = true;
  bool printBy = false;
  bool init = true;
  bool stampDate = false;
  bool cutting = false;
  bool cutted = true;
  bool cutable = true;
  late int digit1;
  late int digit2;
  late int digit3;
  late Timer timer;
  late Timer timer2;
  late Timer timer3;
  //late TextEditingController _textFieldController;
  late ScrollController _controller;
  final _scrollController1 = FixedExtentScrollController(initialItem: 0);
  final _scrollController2 = FixedExtentScrollController(initialItem: 0);
  final _scrollController3 = FixedExtentScrollController(initialItem: 0);

  int counter = 0;
  int counter2 = 0;
  int counter3 = 0;
  int _goodWordIdx = 0;
  int _colorIdx = 0;
  int _gradientIdx = 0;
  double armTop = 74;
  double armLeft = 293;
  double ballArmTop = 55;
  double ballArmLeft = 287;

  double elevation = 5;
  double elevationW = 5;
  double _paperWidth = 113;
  double _paperHeight = 0;
  MaterialColor color3 = AppColor.colorPrimary;

  List<String> resultList = [];
  String dateNow = "";
  String name = "";
  String _nameColorList = "day";
  String _nameGradientList = "gradient";

  Color _machineColor = AppColor.colorPrimary[1]!;
  Color _borderColor = AppColor.colorGrey[3]!;

  DateTime now = DateTime.now();

  //sharedPreference

  String _goodWord = 'สบายใจ';

  List<Color> _nightMode = [
    const Color(0xFF001A35),
    const Color(0xFF3E132C),
    const Color(0xFF1E1E1E),
  ];

  final List<Color> _defautMode = [
    const Color(0xFFFFFFFF),
    const Color(0xFFFFFFFF),
  ];

  @override
  void initState() {
    prepareData();
    super.initState();

    // _prefs.then((SharedPreferences prefs) {
    //   _goodWord = prefs.getString('goodWord') ?? 'สบายใจ';
    //   //return prefs.getString('goodWord') ?? 'สบายใจ';
    // });

    digit1 = 0;
    digit2 = 0;
    digit3 = 0;
    // _textFieldController = TextEditingController();
    _controller = ScrollController(initialScrollOffset: 0.0)
      ..addListener(() {
        if (_controller.offset >= 0) {
          _controller.animateTo(0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear);
        }
      });
    elevation = elevationW;

    input();
  }

  Future<void> prepareData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _goodWord = prefs.getString('goodWord') ?? 'สบายใจ';
    _nameColorList = prefs.getString('nameColorList') ?? 'day';
    _colorIdx = prefs.getInt('colorIdx') ?? 0;
    _nameGradientList = prefs.getString('nameGradientList') ?? 'gradient';
    _gradientIdx = prefs.getInt('gradientIdx') ?? 0;

    if (_nameColorList == 'day') {
      _machineColor = AppColor.day[_colorIdx].color;
    } else if (_nameColorList == 'noppaKao') {
      _machineColor = AppColor.noppaKao[_colorIdx].color;
    } else {
      _machineColor = AppColor.thaiTone[_colorIdx].color;
    }

    if (_nameGradientList == 'gradient') {
      _nightMode = AppColor.gradientApp[_gradientIdx].gradient;
    }

    log('${prefs.getString('goodWord')}');
  }

  @override
  void dispose() {
    _controller.dispose();
    // _textFieldController.dispose();
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  // Future<void> _readSavedData() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final String goodWord = prefs.getString('goodWord') ?? 'สบายใจ';

  //   setState(() {
  //     _goodWord = prefs.setString('goodWord', goodWord).then((bool success) {
  //       return goodWord;
  //     });
  //   });

  //   // _goodWord = prefs.getString('goodWord') ?? 'สบายใจ';
  //   // _nameColorList = prefs.getString('nameColorList') ?? 'day';
  //   // _
  // }

  void _init() {
    _scrollController1.animateToItem(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    _scrollController2.animateToItem(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    _scrollController3.animateToItem(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );

    isSpin = false;
    lastStop = true;
    isPrint = false;
    firstPrint = true;
    printBy = false;
    init = true;
    stampDate = false;
    cutting = false;
    cutable = true;
    cutted = true;
    resultList.clear();
    _paperHeight = 0;

    setState(() {});
  }

  Future<void> _cutting() async {
    cutable = false;
    _paperHeight += 20;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 200), () {});
    final DateTime now = DateTime.now();
    final todayBuddhism = DateTime(now.year + 543, now.month, now.day);
    dateNow = DateFormat('dd/MM/yy').format(todayBuddhism);
    //dateNow = "30/12/65";
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
      bool isHorizontal = _paperWidth >= _paperHeight;
      setState(() {});
      DialogApp(context).showAppDialog(
        childe:
            //resultDialog
            DialogApp(context).saveCapture(
                //title: name,
                color: _machineColor,
                dialogWidth: 324,
                dialogHeight: isHorizontal ? 342 : 426,
                paperWidth: isHorizontal ? 254 : 192,
                paperHeight: isHorizontal ? 158 : 248,
                child: paperResult(percent: 1)),
      );

      _init();
      setState(() {});
    });
  }

  Future<void> _printting() async {
    firstPrint = true;

    cutted = false; //ปริ้นต์อยู่ถือว่าไม่ตัด
    _paperHeight = 50;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 250), () {})
        .then((value) {
      resultList.add("$digit1$digit2$digit3");
      printBy = true;
      setState(() {});
    });
  }

  void input() {
    _actualRollItems = [];
    for (int i = 0; i < 10; i++) {
      _actualRollItems.add(RollItem(
          child: Container(
              alignment: Alignment.center,
              child: Text(
                "$i",
                style: const TextStyle(
                  fontFamily: 'Calistoga-Regular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )),
          index: i));
    }
  }

  Future<void> _start() async {
    //counter = 0;
    Math.Random random = Math.Random();
    int randomResult1 = 30 + random.nextInt(55 - 30);
    //min + _random.nextInt(max - min);

    timer = Timer.periodic(Duration(milliseconds: randomResult1), (timer) {
      _scrollController1.animateToItem(
        counter,
        duration: Duration(milliseconds: randomResult1),
        curve: Curves.linear,
      );
      // _scrollController2.animateToItem(
      //   counter2,
      //   duration: Duration(milliseconds: 50),
      //   curve: Curves.linear,
      // );
      // _scrollController3.animateToItem(
      //   counter3,
      //   duration: Duration(milliseconds: 50),
      //   curve: Curves.linear,
      // );

      counter--;
      // counter2++;
      // counter3 -= 3;

      //log("$counter");
    });

    // await Future.delayed(Duration(milliseconds: 500), () {});

    int randomResult2 = 30 + random.nextInt(55 - 30);

    timer2 = Timer.periodic(Duration(milliseconds: randomResult2), (timer) {
      _scrollController2.animateToItem(
        counter2,
        duration: Duration(milliseconds: randomResult2),
        curve: Curves.linear,
      );

      counter2++;

      //log("$counter");
    });
    //   await Future.delayed(Duration(milliseconds: 500), () {});

    int randomResult3 = 30 + random.nextInt(55 - 30);

    timer3 = Timer.periodic(Duration(milliseconds: randomResult3), (timer) {
      _scrollController3.animateToItem(
        counter3,
        duration: Duration(milliseconds: randomResult3),
        curve: Curves.linear,
      );

      counter3--;

      //log("$counter");
    });

    // _scrollController2.animateToItem(
    //   counter2,
    //   duration: Duration(milliseconds: 45),
    //   curve: Curves.linear,
    // );
    // _scrollController3.animateToItem(
    //   counter3,
    //   duration: Duration(milliseconds: 50),
    //   curve: Curves.linear,
    // );

    log("$randomResult1 $randomResult2 $randomResult3");
    armTop = 170;
    armLeft = 293;
    ballArmTop = 248;
    ballArmLeft = 287;

    setState(() {});
    await Future.delayed(const Duration(milliseconds: 1000), () {
      stop();
    });
  }

  void stop() {
    timer.cancel();
    timer2.cancel();
    timer3.cancel();
    // counter = 2; //หวยล็อก
    // counter2 = 0;
    // counter3 = 3;
    _scrollController1.animateToItem(
      counter,
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
    _scrollController2.animateToItem(
      counter2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
    _scrollController3
        .animateToItem(
      counter3,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    )
        .then((value) async {
      if (resultList.any((element) => element == "$digit1$digit2$digit3")) {
        _start();
      } else {
        //หยุดหมุน
        isSpin = false;
        if (isPrint) {
          _paperHeight += 20;
          setState(() {});
          await Future.delayed(const Duration(milliseconds: 200), () {});

          log("$digit1$digit2$digit3");
          resultList.add("$digit1$digit2$digit3");

          setState(() {});
        }

        // final DateTime now = DateTime.now();
        // final todayBuddhism = DateTime(now.year + 543, now.month, now.day);
        // String formattedDate = DateFormat('dd/MM/yy').format(todayBuddhism);
        // resultList.length == 6 ? resultList.add(formattedDate) : null;
        // setState(() {});
        // log("$resultList");
      }

      return lastStop = true;
    });

    armTop = 74;
    armLeft = 293;
    ballArmTop = 55;
    ballArmLeft = 287;

    // log("$digit1$digit2$digit3");

    setState(() {});
    //log("$digit1$digit2$digit3");
    // log("${_scrollController3.selectedItem}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _machineColor,
        // backgroundColor: const Color(0xFF3E132C),
        title: ads(context),
        //backgroundColor: AppColor.colorPrimary[9]!,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings, size: 30),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              //tooltip: "ปรับแต่งเครื่องสุ่มและพื้นหลังของคุณ",
            ),
          ),
        ],
      ),
      endDrawer: SoomSaamDrawer(
        goodWord: (idx, goodword) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("goodWord", goodword);
          log('${prefs.getString('goodWord')}');

          // final SharedPreferences prefs = await _prefs;
          // await prefs.setString('goodword', goodword);

          _goodWordIdx = idx;
          _goodWord = goodword;

          setState(() {});
        },
        gradient: (name, gradient, idx) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("nameGradientList", name);
          await prefs.setInt("gradientIdx", idx);
          log('${prefs.getString('nameGradientList')} ${prefs.getInt('gradientIdx')}');
          _nightMode = gradient;
          _nameGradientList = name;
          _gradientIdx = idx;
          setState(() {});
        },
        machineColor: (name, machineColor, idx) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("nameColorList", name);
          await prefs.setInt("colorIdx", idx);
          log('${prefs.getString('nameColorList')} ${prefs.getInt('colorIdx')}');
          _machineColor = machineColor;
          _nameColorList = name;
          _colorIdx = idx;

          setState(() {});
        },
        goodWordSelected: _goodWord,
        gradientSelected: _nightMode,
        machineColorSelected: _machineColor,
        nameMachineColorSelected: _nameColorList,
        indexColorList: _colorIdx,
        indexGadientList: _gradientIdx,
        nameGradientSelected: _nameGradientList,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _nightMode,
            ),
          ),
          child: Center(
              child: slotMachine(
                  machineColor: _machineColor,
                  borderColor: _borderColor,
                  printButtonColor: _machineColor,
                  randomButtonColor: _machineColor,
                  soundButtonColor: _machineColor))),
      // bottomSheet: Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: 70,
      //   alignment: Alignment.center,
      //   color: AppColor.colorPrimary,
      //   child: Text(
      //     "รับเลข 3 ตัว 3 สุ่ม ฟรี !!!\nกดไลค์ กดแชร์ กดติดตาม => พิมพ์ชื่อ",
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //         color: Colors.yellow,
      //         fontFamily: 'Kanit-Regular',
      //         fontSize: 20,
      //         fontWeight: FontWeight.w500),
      //   ),
      // ),
    );
  }

  // Widget textField() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     padding: const EdgeInsets.symmetric(horizontal: 40),
  //     child: TextField(
  //       style: TextStyle(
  //         fontFamily: 'Kanit-Regular',
  //         fontSize: 20,
  //         fontWeight: FontWeight.bold,
  //         color: AppColor.colorPrimary,
  //       ),
  //       cursorColor: AppColor.colorPrimary,
  //       textAlign: TextAlign.center,
  //       decoration: const InputDecoration(
  //         contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //         filled: true,
  //         fillColor: AppColor.colorWhite,
  //         focusColor: AppColor.colorPrimary,

  //         //hoverColor: AppColor.colorPrimary,
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: AppColor.colorPrimary, width: 3.0),
  //           borderRadius: BorderRadius.all(Radius.circular(0)),
  //         ),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(0)),
  //         ),
  //         hintText: "โปรดระบุชื่อ",
  //       ),
  //       controller: _textFieldController,
  //       onSubmitted: (String value) async {
  //         name = value;
  //         Math.Random random = Math.Random();
  //         goodWordIdx = random.nextInt(wordList.length);
  //         setState(() {});
  //       },
  //     ),
  //   );
  // }

  Widget ads(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        // height: 70,
        alignment: Alignment.centerLeft,
        color: _machineColor,
        child: const Text(
          "สุ่มสาม",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kanit-Regular',
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      );

  Widget slotMachine(
      {Color machineColor = const Color(0xFFBF0614),
      Color borderColor = const Color(0xFFFBCC45),
      Color printButtonColor = const Color(0xFF2295F0),
      Color randomButtonColor = const Color(0xFFBF0614),
      Color soundButtonColor = const Color(0xFF4AAE51)}) {
    List<Color> g1 = [
      const Color(0xFFD3841D),
      const Color(0xFFFACB3B),
      const Color(0xFFF3A22F),
      const Color(0xFFFECC40),
      const Color(0xFFF7A521),
    ];

    return SizedBox(
      width: 323,
      height: 357,
      child: Stack(clipBehavior: Clip.none, children: [
        // Positioned(
        //     top: 7,
        //     left: 101,
        //     child: Container(
        //       width: 122,
        //       height: 122,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         border: Border.all(width: 3, color: Colors.black),
        //         color: Colors.white,
        //       ),
        //       alignment: Alignment.center,
        //     )),
        Positioned(
            top: 88,
            left: 76,
            child: Container(
              width: 168,
              height: 165,
              color: AppColor.colorPrimary[11],
              // decoration: BoxDecoration(
              //   // gradient: LinearGradient(
              //   //   begin: Alignment.topCenter,
              //   //   end: Alignment.bottomCenter,
              //   //   colors: g3,
              //   // ),
              // //  border: Border.all(width: 3, color: AppColor.colorPrimary[1]!),
              //  // borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              //   color: AppColor.colorPrimary[10],
              // ),
              alignment: Alignment.center,
            )),
        Positioned(
          top: 105,
          left: 43,
          child: Container(
            width: 236,
            height: 112,
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: g1,
              // ),
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
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: g2,
                // ),
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
                    rollSlot(_scrollController1, 1),
                    rollSlot(_scrollController2, 2),
                    rollSlot(_scrollController3, 3),
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
                  colors: g1,
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
                  colors: g1,
                ),
                // border: Border.all(width: 2, color: const Color(0xFFF8C73C)),
                // border: Border.all(width: 3, color: Colors.black),
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
        // Positioned(
        //     top: 170,
        //     left: 293,
        //     child: Container(
        //       width: 9,
        //       height: 79,
        //       decoration: BoxDecoration(
        //         border: Border.all(width: 3, color: Colors.black),
        //         borderRadius: const BorderRadius.all(Radius.circular(0.0)),
        //         color: Colors.white,
        //       ),
        //       alignment: Alignment.center,
        //     )),
        // Positioned(
        //     top: 248,
        //     left: 287,
        //     child: Container(
        //       width: 21,
        //       height: 21,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         border: Border.all(width: 3, color: Colors.black),
        //         color: Colors.white,
        //       ),
        //       alignment: Alignment.center,
        //     )),
        Positioned(
            top: 223,
            left: 33,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [.5, .5],
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
                  stops: [.5, .5],
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
          child: MyArc(diameter: 83, color: borderColor),
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
              _goodWord,
              maxLines: 1,
              minFontSize: 10,
              style: TextStyle(
                // letterSpacing: 0.5,
                fontFamily: 'Kanit-Regular',
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
              child: const Text(
                "สุ่ม",
                style: TextStyle(
                    fontFamily: 'Kanit-Regular',
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
              width: 32,
              height: 30,
              color: soundButtonColor,
              shadowColor: AppColor.colorBlack.withOpacity(0.5),
              child: const Icon(
                Icons.volume_off,
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
              child: paperAnimated(width: _paperWidth)),
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
        )
      ]),
    );
  }

  Widget paperResult({double width = 113, double percent = 1}) => Container(
        // padding: const EdgeInsets.symmetric(vertical: 10),
        width: width * percent,
        height: _paperHeight * percent,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: g3,
          // ),
          border: Border.all(width: 1 * percent, color: AppColor.paper[1]!),
          //borderRadius: const BorderRadius.all(Radius.circular(0.0)),
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
                  fontFamily: 'SOV_wayo',
                  fontSize: 30 * percent,
                  fontWeight: FontWeight.bold,
                  color: AppColor.paper[3]!),
            ),
          ),
          for (var data in resultList.reversed) //ข้อมูล
            Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              width: width * percent,
              height: 20 * percent,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1 * percent, color: AppColor.paper[2]!))),
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(
                    //letterSpacing: 5,
                    height: 0.77,
                    fontFamily: 'SOV_wayo',
                    fontSize: 30 * percent,
                    fontWeight: FontWeight.bold,
                    color: AppColor.paper[3]!),
              ),
            ),
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
              "$_goodWord  ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  // height: 1.5,
                  fontFamily: 'SOV_wayo',
                  fontSize: 18 * percent,
                  fontWeight: FontWeight.bold,
                  color: AppColor.paper[3]!),
            ),
          )
        ]),
      );

  Widget paperAnimated({double width = 113}) => AnimatedContainer(
        // padding: const EdgeInsets.symmetric(vertical: 10),
        width: width,
        height: _paperHeight,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: g3,
          // ),
          border: Border.all(width: 1, color: AppColor.paper[1]!),
          //borderRadius: const BorderRadius.all(Radius.circular(0.0)),
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
                    fontFamily: 'SOV_wayo',
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
                    fontFamily: 'SOV_wayo',
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
              // height: 20,
              // decoration: BoxDecoration(
              //     border: Border(
              //         top:
              //             BorderSide(width: 0, color: AppColor.paper[2]!))),
              child: AutoSizeText(
                "$_goodWord  ",
                textAlign: TextAlign.center,
                maxLines: 1,
                minFontSize: 10,
                style: TextStyle(
                    // height: 1.5,
                    fontFamily: 'SOV_wayo',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.paper[3]!),
              ),
            )
        ]),
      );

  Widget rollSlot(ScrollController controller, int digit) => Container(
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
          child: slot(controller, digit),
        ),
      );

  Widget slot(ScrollController controller, int digit) {
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

  // Widget flat3dButton(
  //     {Color? color,
  //     Color? shadowColor,
  //     double? width,
  //     double? height,
  //     Widget? child,
  //     bool enable = true}) {
  //   // final MaterialColor color = color ??
  //   //     (Theme.of(context).colorScheme.primary as MaterialColor);
  //   return GestureDetector(
  //     // onTap: (() {}),
  //     onTapDown: (_) {
  //       if (enable) {
  //         setState(() {
  //           elevation = 0;
  //         });
  //       }
  //     },
  //     onTapUp: (_) {
  //       if (enable) {
  //         setState(() {
  //           elevation = elevationW;
  //         });
  //       }
  //     },
  //     child: MouseRegion(
  //       cursor: SystemMouseCursors.click,
  //       child: AnimatedContainer(
  //         width: width,
  //         height: height,
  //         alignment: Alignment.center,
  //         margin: EdgeInsets.only(top: elevationW - elevation),
  //         duration: const Duration(milliseconds: 150),
  //         decoration: BoxDecoration(
  //           color: color ?? AppColor.colorPrimary,
  //           border: Border(
  //             bottom: BorderSide(
  //               color: shadowColor ?? const Color(0xFF6B0003),
  //               // color: color.shade700,
  //               width: elevation,
  //             ),
  //           ),
  //         ),
  //         // padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
  //         child: child,
  //       ),
  //     ),
  //   );
  // }
}

class CustomFlat3dButton extends StatefulWidget {
  const CustomFlat3dButton(
      {super.key,
      this.width = 20,
      this.height = 20,
      this.elevation = 5,
      this.color = const Color(0xFFBF0614),
      this.shadowColor = const Color(0xFF6B0003),
      this.child,
      this.onTap,
      this.enable = true});

  final double width;
  final double height;
  final double elevation;
  final Color color;
  final Color shadowColor;
  final bool enable;
  final Widget? child;
  final void Function()? onTap;

  @override
  State<CustomFlat3dButton> createState() => _CustomFlat3dButtonState();
}

class _CustomFlat3dButtonState extends State<CustomFlat3dButton> {
  late double _elevation;
  @override
  void initState() {
    super.initState();

    _elevation = widget.elevation;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        if (widget.enable) {
          setState(() {
            _elevation = 0;
          });
        }
      },
      onTapUp: (_) {
        if (widget.enable) {
          setState(() {
            _elevation = widget.elevation;
          });
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: widget.elevation - _elevation),
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: widget.color,
            border: Border(
              bottom: BorderSide(
                color: widget.shadowColor,
                // color: color.shade700,
                width: _elevation,
              ),
            ),
          ),
          // padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          child: widget.child,
        ),
      ),
    );
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
      Math.pi,
      Math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DialogApp {
  final BuildContext context;

  DialogApp(this.context);

  Future<void> showAppDialog(
      {required Widget childe,
      //required bool isAlertSound,
      bool? barrierDismissible}) async {
    //log("play sound");
    // if (isAlertSound) {
    //   SoundOn.alert();
    // } else {
    //   SoundOn.fail();
    // }
    // await 2.delay();
    // assetsAudioPlayer.stop();
    return await showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible ?? false, // user must tap button!
      builder: (BuildContext context) {
        return childe;
      },
    );
  }

  Widget dialogBox(
          {required Widget child, double height = 342, double width = 324}) =>
      Dialog(
        //insetPadding: const EdgeInsets.symmetric(horizontal: 33),
        child: Container(
          // constraints: BoxConstraints(maxHeight: height),
          width: width,

          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(
              //color: AppColor.colorWhite,
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: child,
        ),
      );

  Widget saveCapture(
      {required Widget child,
      String title = "ผลการสุ่ม",
      String middleText = "บันทึกผลการสุ่มหรือไม่",
      double dialogWidth = 324,
      double dialogHeight = 342,
      double paperWidth = 254,
      double paperHeight = 158,
      Color? color}) {
    return dialogBox(
      width: dialogWidth,
      height: dialogHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: paperWidth,
                height: paperHeight,
                // child: Container(color: AppColor.colorPrimary),
                child: FittedBox(fit: BoxFit.contain, child: child)),
            const SizedBox(
              height: 7,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Kanit-Regular',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              middleText,
              style: const TextStyle(
                  fontFamily: 'Kanit-Regular',
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(
                    title: "ยกเลิก",
                    isOutline: true,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    color: color),
                button(title: "ยืนยัน", isOutline: false, color: color)
              ],
            )
          ]),
    );
  }

  Widget button(
      {double width = 80,
      double height = 38,
      bool isOutline = false,
      String title = "คลิกสิ!",
      void Function()? onTap,
      Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: isOutline
                ? Border.all(width: 1, color: color ?? AppColor.colorPrimary)
                : null,
            color: isOutline
                ? AppColor.colorWhite
                : color ?? AppColor.colorPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: TextStyle(
              fontFamily: 'Kanit-Regular',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: !isOutline
                  ? AppColor.colorWhite
                  : color ?? AppColor.colorPrimary),
        ),
      ),
    );
  }
}
