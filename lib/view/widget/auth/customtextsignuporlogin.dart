// ignore: file_names
import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class CustomtextSignupORLogin extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function()? onTap;

  const CustomtextSignupORLogin({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo,
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
