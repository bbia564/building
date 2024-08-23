import 'package:construction_roofing/pages/roofing_first/roofing_first_view.dart';
import 'package:construction_roofing/pages/roofing_second/roofing_second_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'roofing_tab_logic.dart';

class RoofingTabPage extends GetView<RoofingTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          RoofingFirstPage(),
          RoofingSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navRoofBars()),
    );
  }

  Widget _navRoofBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.5)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.5)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
