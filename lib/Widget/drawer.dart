import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:randint/utils/color.dart';

class SoomSaamDrawer extends StatefulWidget {
  const SoomSaamDrawer(
      {super.key,
      required this.machineColor,
      required this.gradient,
      required this.goodWord,
      required this.machineColorSelected,
      required this.gradientSelected,
      required this.goodWordSelected,
      required this.nameMachineColorSelected,
      required this.indexColorList,
      required this.nameGradientSelected,
      required this.indexGadientList});

  final Function(String, Color, int) machineColor;
  final Color machineColorSelected;
  final String nameMachineColorSelected;
  final int indexColorList;

  final Function(String, List<Color>, int) gradient;
  final List<Color> gradientSelected;
  final String nameGradientSelected;
  final int indexGadientList;

  final Function(int, String) goodWord;
  final String goodWordSelected;

  @override
  State<SoomSaamDrawer> createState() => _SoomSaamDrawerState();
}

class _SoomSaamDrawerState extends State<SoomSaamDrawer> {
  TextStyle header = TextStyle(
    fontFamily: 'Kanit-Regular',
    fontSize: 16,
    color: AppColor.colorText[1],
  );

  TextStyle child = TextStyle(
    fontFamily: 'Kanit-Regular',
    fontSize: 14,
    color: AppColor.paper[1],
  );
  TextStyle headerChild = TextStyle(
    fontFamily: 'Kanit-Regular',
    fontSize: 13,
    color: AppColor.colorText[3],
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Drawer(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                  color: widget.machineColorSelected,
                ),
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    ExpansionTile(
                      //initiallyExpanded: true,
                      leading: _iconDrawer(icon: Icons.star),
                      trailing: Text(
                        widget.goodWordSelected,
                        style: TextStyle(
                          fontFamily: 'Kanit-Regular',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: widget.machineColorSelected,
                        ),
                      ),
                      // tileColor: AppColor.colorPrimary[15]!,
                      title: Text(
                        "คำมงคล",
                        style: header,
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      children: [
                        for (int i = 0;
                            i < (AppColor.goodWord.length / 4).ceil();
                            i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int j = 0; j < 4; j++)
                                _buttonGoodWord(
                                  title: AppColor.goodWord[i * 4 + j],
                                  color: widget.machineColorSelected,
                                  selected: AppColor.goodWord
                                          .indexOf(widget.goodWordSelected) ==
                                      i * 4 + j,
                                  onTap: () {
                                    widget.goodWord(i * 4 + j,
                                        AppColor.goodWord[i * 4 + j]);
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                ),
                            ],
                          ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: const EdgeInsets.fromLTRB(50, 0, 0, 12),
                      leading: _iconDrawer(icon: Icons.color_lens_rounded),
                      trailing: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.machineColorSelected),
                      ),
                      // tileColor: AppColor.colorPrimary[15]!,
                      title: Text(
                        "สีเครื่องสุ่ม",
                        style: header,
                      ),
                      // subtitle: Text(
                      //   "ม่วงอัญชัน",
                      //   style: headerChild,
                      // ),

                      children: [
                        _colorList(
                          name: "day",
                          title: "วันทั้งเจ็ด",
                          colorList: AppColor.day,
                          perRow: 2,
                          //isSelected: widget.nameMachineColorSelected == "day"
                        ),
                        _colorList(
                            name: "noppaKao",
                            title: "นพรัตน์",
                            colorList: AppColor.noppaKao,
                            perRow: 2),
                        _colorList(
                            name: 'thaiTone',
                            title: "แบบไทย",
                            colorList: AppColor.thaiTone,
                            perRow: 2),
                      ],
                    ),
                    ExpansionTile(
                      leading: _iconDrawer(icon: Icons.brush_rounded),
                      trailing: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: widget.gradientSelected)),
                      ),
                      // tileColor: AppColor.colorPrimary[15]!,
                      title: Text(
                        "พื้นหลัง",
                        style: header,
                      ),
                      childrenPadding:
                          const EdgeInsets.fromLTRB(40, 12, 12, 12),
                      children: [
                        _gardientList(
                            perRow: 4,
                            gardientList: AppColor.gradientApp,
                            //  title: "ไล่ระดับสี",
                            showName: false,
                            name: 'gradient'),
                        // _colorList(
                        //     colorList: AppColor.thaiTone,
                        //     perRow: 4,
                        //     title: "สีเดียว",
                        //     showName: false),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          );
        },
      ),
    );
  }

  Column _colorList(
          {String? title,
          required List<NameColor> colorList,
          required int perRow,
          bool showName = true,
          required String name}) =>
      Column(children: [
        title != null
            ? SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  title,
                  style: headerChild,
                ),
              )
            : const SizedBox(),
        for (int i = 0; i < (colorList.length / perRow).ceil(); i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int j = 0; j < perRow; j++)
                colorList.asMap().containsKey(i * perRow + j)
                    ? Expanded(
                        child: InkWell(
                          onTap: () {
                            widget.machineColor(
                                name,
                                colorList[i * perRow + j].color,
                                i * perRow + j);
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorList[i * perRow + j].color),
                                child: name ==
                                            widget.nameMachineColorSelected &&
                                        widget.indexColorList == i * perRow + j
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColor.colorWhite,
                                        size: 20,
                                      )
                                    : null,
                              ),
                              showName
                                  ? Expanded(
                                      child: AutoSizeText(
                                        colorList[i * perRow + j].name,
                                        style: TextStyle(
                                          fontFamily: 'Kanit-Regular',
                                          fontSize: 14,
                                          color: AppColor.paper[1],
                                        ),
                                        maxLines: 1,
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 35,
                          height: 35,
                        ),
                      )
            ],
          ),
      ]);
  Column _gardientList(
          {String? title,
          required List<NameGradient> gardientList,
          required int perRow,
          bool showName = true,
          required String name,
          void Function()? onTap}) =>
      Column(children: [
        title != null
            ? SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  title,
                  style: headerChild,
                ),
              )
            : const SizedBox(),
        for (int i = 0; i < (gardientList.length / perRow).ceil(); i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int j = 0; j < perRow; j++)
                gardientList.asMap().containsKey(i * perRow + j)
                    ? Expanded(
                        child: Row(
                          children: [
                            InkWell(
                              // tooltip: AppColor.thaiTone[i * 2 + j].name,
                              // padding: EdgeInsets.zero,

                              onTap: () {
                                widget.gradient(
                                    name,
                                    gardientList[i * perRow + j].gradient,
                                    i * perRow + j);
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                              // tooltip: AppColor.thaiTone[i * 2 + j].name,
                              // padding: EdgeInsets.zero,

                              child: Container(
                                width: 35,
                                height: 35,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: gardientList[i * perRow + j]
                                          .gradient),
                                ),
                                child: name == widget.nameGradientSelected &&
                                        widget.indexGadientList ==
                                            i * perRow + j
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColor.colorWhite,
                                        size: 20,
                                      )
                                    : null,
                              ),
                            ),
                            showName
                                ? Expanded(
                                    child: AutoSizeText(
                                      gardientList[i * perRow + j].name,
                                      style: TextStyle(
                                        fontFamily: 'Kanit-Regular',
                                        fontSize: 14,
                                        color: AppColor.paper[1],
                                      ),
                                      maxLines: 1,
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 35,
                          height: 35,
                        ),
                      )
            ],
          ),
      ]);
  // Column _gardientList(
  //         {String? title,
  //         required List<NameGradient> gardientList,
  //         required int perRow}) =>
  //     Column(children: [
  //       title != null
  //           ? SizedBox(
  //               width: MediaQuery.of(context).size.width / 1.2,
  //               child: Text(
  //                 title,
  //                 style: headerChild,
  //               ),
  //             )
  //           : const SizedBox(),
  //       for (int i = 0; i < (gardientList.length / perRow).ceil(); i++)
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             for (int j = 0; j < perRow; j++)
  //               gardientList.asMap().containsKey(i * perRow + j)
  //                   ? Expanded(
  //                       child: InkWell(
  //                         // tooltip: AppColor.thaiTone[i * 2 + j].name,
  //                         // padding: EdgeInsets.zero,

  //                         child: Container(
  //                             width: 35,
  //                             height: 35,
  //                             margin: const EdgeInsets.all(8),
  //                             decoration: BoxDecoration(
  //                               shape: BoxShape.circle,
  //                               gradient: LinearGradient(
  //                                   begin: Alignment.topCenter,
  //                                   end: Alignment.bottomCenter,
  //                                   colors:
  //                                       gardientList[i * perRow + j].gradient),
  //                             )
  //                             //color: colorList[i * perRow + j].color),
  //                             ),
  //                         onTap: () {},
  //                       ),
  //                     )
  //                   : const Padding(
  //                       padding: EdgeInsets.all(8.0),
  //                       child: SizedBox(
  //                         width: 35,
  //                         height: 35,
  //                       ),
  //                     )
  //           ],
  //         ),
  //     ]);

  Widget _iconDrawer({required IconData icon, Color? iconColor}) => Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.colorGrey[2]!,
        ),
        child: Icon(
          icon,
          size: 20,
          color: iconColor ?? AppColor.colorText,
        ),
      );

  Widget _buttonGoodWord(
          {String? title,
          Color? color,
          bool selected = false,
          void Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
          width: 60,
          height: 25,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: color ?? AppColor.colorPrimary),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color:
                selected ? color ?? AppColor.colorPrimary : AppColor.colorWhite,

            // shape: BoxShape.circle,
            // color: AppColor.day[i * 2 + j]
          ),
          child: AutoSizeText(
            title ?? "",
            maxLines: 1,
            style: TextStyle(
                fontFamily: 'Kanit-Regular',
                color: selected
                    ? AppColor.colorWhite
                    : color ?? AppColor.colorPrimary,
                fontSize: 13),
          ),
        ),
      );
}
