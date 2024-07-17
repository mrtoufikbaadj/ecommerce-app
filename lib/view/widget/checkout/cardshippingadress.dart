import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Cardshippingadress extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const Cardshippingadress(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive == true ? AppColor.secondColor : Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ListTile(
        textColor: isActive == true ? Colors.white : AppColor.secondColor,
        title: Text(title),
        subtitle: Text(body),
      ),
    );
  }
}
