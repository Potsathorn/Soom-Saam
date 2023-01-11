import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class DialogApp {
  final BuildContext context;
  DialogApp(this.context);
  Future<void> showAppDialog(
      {required Widget childe, bool? barrierDismissible}) async {
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
      Color? color,
      void Function()? onTapCancel,
      void Function()? onTapConfirm}) {
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
            AutoSizeText(
              title,
              maxLines: 1,
              style: const TextStyle(
                  fontFamily: 'Kanit-Regular',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            AutoSizeText(
              middleText,
              maxLines: 1,
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
                    onTap: onTapCancel,
                    color: color),
                button(
                    title: "ยืนยัน",
                    isOutline: false,
                    color: color,
                    onTap: onTapConfirm)
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
