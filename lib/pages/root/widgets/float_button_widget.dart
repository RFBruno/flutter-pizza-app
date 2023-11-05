import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_app/color.dart';

class FloatButtonWidget extends StatelessWidget {
  const FloatButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
