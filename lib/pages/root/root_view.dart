// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/pages/home/home_view.dart';
import 'package:pizza_app/pages/root/root_controller.dart';
import 'package:pizza_app/pages/root/widgets/bottom_navigation_widget.dart';
import 'package:pizza_app/pages/root/widgets/float_button_widget.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyWidget(controller: controller),
      bottomNavigationBar: BottomNavigationWidget(controller: controller),
      floatingActionButton: const FloatButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BodyWidget extends StatelessWidget {
  final RootController controller;
  const BodyWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IndexedStack(
        index: controller.tabIndex.value,
        children: const [
          HomeView(),
          Center(child: Text('Building')),
        ],
      );
    });
  }
}
