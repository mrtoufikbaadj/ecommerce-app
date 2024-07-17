import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class CardPaymentMethod extends StatelessWidget {
  final String titile;
  final bool isActive;
  const CardPaymentMethod(
      {super.key, required this.titile, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color:
                isActive == true ? AppColor.thirdColor : AppColor.secondColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          titile,
          style: TextStyle(
              color: isActive == true ? Colors.white : Colors.black,
              height: 1,
              fontWeight: isActive == true ? FontWeight.bold : null),
        ));
  }
}
