import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/color.dart';
import 'package:pizza_app/components/tabbar_item.dart';
import 'package:pizza_app/pages/root/root_controller.dart';

class BottomNavigationWidget extends StatelessWidget {
  final RootController controller;
  const BottomNavigationWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedBottomNavigationBar.builder(
        backgroundGradient: gradientFullPrimary,
        onTap: (index) {
          controller.tabIndex.value = index;
        },
        itemCount: controller.tabs.length,
        backgroundColor: background,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        tabBuilder: (int index, bool isActive) {
          return TabBarItem(
            isActive: isActive,
            icon: controller.tabs[index],
          );
        },
        activeIndex: controller.tabIndex.value,
      );
    });
  }
}
