import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Customtitlehome extends StatelessWidget {
  final String title;
  const Customtitlehome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
