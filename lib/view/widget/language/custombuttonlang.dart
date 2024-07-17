import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Custombuttonlang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const Custombuttonlang({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
