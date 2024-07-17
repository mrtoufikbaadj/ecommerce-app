import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/productdetails_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Subitemslist extends GetView<ProductDetailsControllerImp> {
  const Subitemslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitems[index]["active"] == "1"
                    ? AppColor.secondColor
                    : Colors.white,
                border: Border.all(color: AppColor.fourthColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              controller.subitems[index]["name"],
              style: TextStyle(
                  color: controller.subitems[index]["active"] == "1"
                      ? Colors.white
                      : AppColor.fourthColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
