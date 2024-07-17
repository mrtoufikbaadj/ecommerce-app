import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class CardDeliveryType extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isActive;
  const CardDeliveryType(
      {super.key,
      required this.title,
      required this.isActive,
      required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.secondColor : null,
          border: Border.all(color: AppColor.secondColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            color: isActive == true ? Colors.white : null,
            width: 80,
            height: 80,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive == true ? Colors.white : AppColor.secondColor,
                fontWeight: isActive == true ? FontWeight.bold : null),
          ),
        ],
      ),
    );
  }
}
