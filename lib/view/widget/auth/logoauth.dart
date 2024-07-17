import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/imageasset.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 230,
    );
  }
}
