import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonCoupon(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      // margin: EdgeInsets.symmetric(horizontal: 100),
      color: AppColor.primaryColor,
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
