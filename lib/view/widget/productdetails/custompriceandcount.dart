import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/productdetails_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Custompriceandcount extends GetView<ProductDetailsControllerImp> {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const Custompriceandcount({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              width: 50,
              padding: const EdgeInsets.only(bottom: 7),
              decoration:
                  BoxDecoration(border: Border.all(color: AppColor.black)),
              child: Text(
                count,
                style: TextStyle(fontSize: 20),
              ),
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price \$ ",
          style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
