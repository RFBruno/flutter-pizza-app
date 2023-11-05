import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pizza_app/color.dart';
import 'package:pizza_app/components/category_tab.dart';
import 'package:pizza_app/components/product_item.dart';
import 'package:pizza_app/constant.dart';
import 'package:pizza_app/data/product_data.dart';
import 'package:pizza_app/pages/home/home_controller.dart';
import 'package:pizza_app/routers/app_route_name.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getHeader(),
          _getSearch(),
          _getCategories(),
          _getPopular(),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: gap, right: gap, top: gap),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hey, JJ Silva",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Let's find quanlity food",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primary.withOpacity(0.5),
                  ),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(gap),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset("assets/images/user.jpg"),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getSearch() {
    return Container(
        padding: const EdgeInsets.only(left: gap, right: gap, top: gap),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 6,
                      offset: const Offset(0, 3),
                      color: black.withOpacity(0.03),
                    )
                  ]),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search food...",
                      hintStyle: TextStyle(color: primary.withOpacity(0.5)),
                      filled: true,
                      fillColor: white,
                      prefixIcon: Container(
                          padding: const EdgeInsets.all(10),
                          width: 28,
                          height: 28,
                          child: SvgPicture.asset("assets/icons/search.svg")),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(gap),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(gap),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(gap),
                    color: secodPrimary),
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: SvgPicture.asset("assets/icons/filter.svg"),
                ),
              )
            ],
          ),
        ));
  }

  Widget _getCategories() {
    return Container(
      padding: const EdgeInsets.only(top: gap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: gap, right: gap),
            child: const Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: gap,
          ),
          const CategoryTab()
        ],
      ),
    );
  }

  Widget _getPopular() {
    return Container(
      padding: const EdgeInsets.only(top: gap),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: gap, right: gap),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      color: black.withOpacity(0.5),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: gap,
          ),
          Container(
            padding: const EdgeInsets.only(left: gap, right: gap),
            child: Column(
              children: List.generate(PRODUCTS.length, (index) {
                var product = PRODUCTS[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteName.detail,
                        arguments: {"data": product});
                  },
                  child: ProductItem(
                    tag: product["id"],
                    title: product["title"],
                    description: product["description"],
                    calory: product["calories"],
                    price: product["price"],
                    image: product["image"],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
