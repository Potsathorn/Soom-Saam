import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundOn {
  static Future<void> random() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool soundOn = prefs.getBool('soundOn') ?? true;

    if (soundOn) {
      final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
      log("play random sound");
      assetsAudioPlayer.open(Audio("assets/audio/random.wav"), autoStart: true);
    } else {
      log("off random sound");
    }
  }

  static Future<void> print() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool soundOn = prefs.getBool('soundOn') ?? true;

    if (soundOn) {
      final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
      log("play print sound");
      assetsAudioPlayer.open(Audio("assets/audio/printing.wav"),
          autoStart: true);
    } else {
      log("off print sound");
    }
  }

  // static void fail() {
  //   final DashboardController controller = Get.put(DashboardController());
  //   if (controller.soundOn.value) {
  //     final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  //     log("play fail sound");
  //     assetsAudioPlayer.open(Audio("assets/sound/effect/fail.mp3"),
  //         autoStart: true);
  //   } else {
  //     log("off fail sound");
  //   }
  // }

  // static void alert() {
  //   final DashboardController controller = Get.put(DashboardController());
  //   if (controller.soundOn.value) {
  //     final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  //     log("play alert sound");
  //     assetsAudioPlayer.open(Audio("assets/sound/effect/alert.mp3"),
  //         autoStart: true);
  //   } else {
  //     log("off alert sound");
  //   }
}

//   static Future<void> barcode() async {
//     final DashboardController controller = Get.put(DashboardController());
//     if (controller.soundOn.value) {
//       final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
//       log("play barcode sound");
//       await assetsAudioPlayer.open(Audio("assets/sound/effect/barcode.mp3"),
//           autoStart: true);
//     } else {
//       log("off barcode sound");
//     }
//   }
// }
