import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pizza_app/color.dart';
import 'package:pizza_app/components/tabbar_item.dart';
import 'package:pizza_app/pages/home/home_view.dart';
import 'package:pizza_app/pages/root/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(),
        bottomNavigationBar: _buildFooter(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: secodPrimary,
          child: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              "assets/icons/cart.svg",
              colorFilter: const ColorFilter.mode(primary, BlendMode.srcIn),
            ),
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: controller.tabIndex.value,
      children: const [
        HomeView(),
        Center(child: Text('Building')),
      ],
    );
  }

  Widget _buildFooter() {
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
  }
}
