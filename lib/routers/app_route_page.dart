//define all your page here
import 'package:get/get.dart';
import 'package:pizza_app/pages/detail/detail_binding.dart';
import 'package:pizza_app/pages/detail/detail_view.dart';
import 'package:pizza_app/pages/home/home_binding.dart';
import 'package:pizza_app/pages/home/home_view.dart';
import 'package:pizza_app/pages/root/root_binding.dart';
import 'package:pizza_app/pages/root/root_view.dart';
import 'package:pizza_app/routers/app_route_name.dart';

class AppRoutePage {
  static final routes = [
    GetPage(
        name: AppRouteName.home,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: AppRouteName.root,
        page: () => const RootView(),
        binding: RootBinding()),
    GetPage(
        name: AppRouteName.detail,
        page: () => const DetailView(),
        binding: DetailBinding())
  ];
}
