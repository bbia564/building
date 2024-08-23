import 'package:construction_roofing/db_roofing/db_roofing.dart';
import 'package:construction_roofing/pages/roofing_build/binding.dart';
import 'package:construction_roofing/pages/roofing_build/view.dart';
import 'package:construction_roofing/pages/roofing_first/module_four/module_four_binding.dart';
import 'package:construction_roofing/pages/roofing_first/module_four/module_four_view.dart';
import 'package:construction_roofing/pages/roofing_first/module_one/module_one_binding.dart';
import 'package:construction_roofing/pages/roofing_first/module_one/module_one_view.dart';
import 'package:construction_roofing/pages/roofing_first/module_three/module_three_binding.dart';
import 'package:construction_roofing/pages/roofing_first/module_three/module_three_view.dart';
import 'package:construction_roofing/pages/roofing_first/module_two/module_two_binding.dart';
import 'package:construction_roofing/pages/roofing_first/module_two/module_two_view.dart';
import 'package:construction_roofing/pages/roofing_first/result_list/result_list_binding.dart';
import 'package:construction_roofing/pages/roofing_first/result_list/result_list_view.dart';
import 'package:construction_roofing/pages/roofing_first/roofing_first_binding.dart';
import 'package:construction_roofing/pages/roofing_first/roofing_first_view.dart';
import 'package:construction_roofing/pages/roofing_second/roofing_second_binding.dart';
import 'package:construction_roofing/pages/roofing_second/roofing_second_view.dart';
import 'package:construction_roofing/pages/roofing_tab/roofing_tab_binding.dart';
import 'package:construction_roofing/pages/roofing_tab/roofing_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'db_roofing/buliding.dart';

Color primaryColor = const Color(0xff6f3cff);
Color bgColor = const Color(0xfff4f3f9);
List<String> titles = const ['Dovetail cut','Broken Hill roof', 'Number of trusses','Roof shingles'];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBRoofing().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: GetPs,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> GetPs = [
  GetPage(name: '/', page: () => const RoofPage(),binding: RoofBinding()),
  GetPage(name: '/roofing_tab', page: () => RoofingTabPage(), binding: RoofingTabBinding()),
  GetPage(name:'/roofing_first', page: () => RoofingFirstPage(), binding: RoofingFirstBinding()),
  GetPage(name: '/roofing_second', page: () => RoofingSecondPage(), binding: RoofingSecondBinding()),
  GetPage(name: '/roofing_build', page: () => const RoofbuildControl()),
  GetPage(name: '/module_one', page: () => ModuleOnePage(),binding: ModuleOneBinding()),
  GetPage(name: '/module_two', page: () => ModuleTwoPage(),binding: ModuleTwoBinding()),
  GetPage(name: '/module_three', page: () => ModuleThreePage(),binding: ModuleThreeBinding()),
  GetPage(name: '/module_four', page: () => ModuleFourPage(),binding: ModuleFourBinding()),
  GetPage(name: '/result_list', page: () => ResultListPage(),binding: ResultListBinding())
];