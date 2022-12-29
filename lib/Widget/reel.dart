import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reel extends StatefulWidget {
  const Reel({super.key});

  @override
  State<Reel> createState() => _ReelState();
}

class _ReelState extends State<Reel> {
  List<RollerItem> _actualRollItems = [];
  bool isClick = false;
  late int seletedItem;
  late Timer timer;
  final _scrollController = FixedExtentScrollController(initialItem: 0);
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seletedItem = 0;
    input();
  }

  void input() {
    _actualRollItems = [];
    for (int i = 0; i < 10; i++) {
      _actualRollItems.add(RollerItem(
          child: Container(
              alignment: Alignment.center,
              color: Colors.amberAccent,
              child: Text(
                "$i",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          index: i));
    }
  }

  void _start() {
    counter = 0;
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _scrollController.animateToItem(
        counter,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
      counter++;
      log("$counter");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100, //96,
      child: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: (index) {
          setState(() {
            seletedItem = index;
            log("$seletedItem");
          });
        },
        controller: _scrollController,
        itemExtent: 48,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: _actualRollItems.map<Widget>((item) {
            return SizedBox(
              width: 50,
              height: 48,
              child: item.child,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class RollerItem {
  const RollerItem({
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;
}
