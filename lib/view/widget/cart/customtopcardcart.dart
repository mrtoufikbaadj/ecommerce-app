import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Customtopcardcart extends StatelessWidget {
  final String message;
  const Customtopcardcart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.primaryColor),
      child: Text(
        message,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
