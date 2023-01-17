// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final inAppWord = inAppWordFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

InAppWord inAppWordFromJson(Map<String, dynamic> json) =>
    InAppWord.fromJson(json);

InAppWord? inAppWordFromJsonString(String str) =>
    InAppWord.fromJson(json.decode(str));

String inAppWordToJson(InAppWord? data) => json.encode(data!.toJson());

class InAppWord {
  InAppWord({
    this.language,
    this.appName,
    this.randomButton,
    this.dGoodWord,
    this.dColor,
    this.dBackground,
    this.dLanguage,
    this.dExit,
    this.day,
    this.noppaKao,
    this.thaiTone,
  });

  String? language;
  String? appName;
  String? randomButton;
  String? dGoodWord;
  String? dColor;
  String? dBackground;
  String? dLanguage;
  String? dExit;
  String? day;
  String? noppaKao;
  String? thaiTone;

  InAppWord copyWith({
    String? language,
    String? appName,
    String? randomButton,
    String? dGoodWord,
    String? dColor,
    String? dBackground,
    String? dLanguage,
    String? dExit,
    String? day,
    String? noppaKao,
    String? thaiTone,
  }) =>
      InAppWord(
        language: language ?? this.language,
        appName: appName ?? this.appName,
        randomButton: randomButton ?? this.randomButton,
        dGoodWord: dGoodWord ?? this.dGoodWord,
        dColor: dColor ?? this.dColor,
        dBackground: dBackground ?? this.dBackground,
        dLanguage: dLanguage ?? this.dLanguage,
        dExit: dExit ?? this.dExit,
        day: day ?? this.day,
        noppaKao: noppaKao ?? this.noppaKao,
        thaiTone: thaiTone ?? this.thaiTone,
      );

  factory InAppWord.fromJson(Map<String, dynamic> json) => InAppWord(
        language: json["language"],
        appName: json["appName"],
        randomButton: json["randomButton"],
        dGoodWord: json["dGoodWord"],
        dColor: json["dColor"],
        dBackground: json["dBackground"],
        dLanguage: json["dLanguage"],
        dExit: json["dExit"],
        day: json["day"],
        noppaKao: json["noppaKao"],
        thaiTone: json["thaiTone"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "appName": appName,
        "randomButton": randomButton,
        "dGoodWord": dGoodWord,
        "dColor": dColor,
        "dBackground": dBackground,
        "dLanguage": dLanguage,
        "dExit": dExit,
        "day": day,
        "noppaKao": noppaKao,
        "thaiTone": thaiTone,
      };
}

class Languages {
  static InAppWord inAppWord(String lang) {
    InAppWord inAppWord = inAppWordFromJson(th);
    if (lang == 'ภาษาไทย') {
      inAppWord = inAppWordFromJson(th);
    } else {
      inAppWord = inAppWordFromJson(en);
    }
    log(lang);
    return inAppWord;
  }

  static var th = {
    "language": "ภาษาไทย",
    "appName": "สุ่มสาม",
    "randomButton": "สุ่ม",
    "dGoodWord": "คำมงคล",
    "dColor": "สีเครื่องสุ่ม",
    "dBackground": "พื้นหลัง",
    "dLanguage": "ภาษา",
    "dExit": "ออกจากแอป",
    "day": "วันทั้งเจ็ด",
    "noppaKao": "นพรัตน์",
    "thaiTone": "แบบไทย"
  };

  static var en = {
    "language": "English",
    "appName": "Random Three Digits",
    "randomButton": "SPIN",
    "dGoodWord": "Auspicious Word",
    "dColor": "Color",
    "dBackground": "Background",
    "dLanguage": "Language",
    "dExit": "Exit",
    "day": "Seven Days",
    "noppaKao": "Nine Gemes",
    "thaiTone": "Thai Tone"
  };
}
