import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class CustomButtonOrder extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonOrder(
      {super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 100),
      color: AppColor.primaryColor,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          textButton,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
