import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Custombuttomappbar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbuttom;
  final IconData icondata;

  final bool activecolor;
  const Custombuttomappbar({
    super.key,
    required this.onPressed,
    required this.textbuttom,
    required this.icondata,
    required this.activecolor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: activecolor == true ? AppColor.primaryColor : AppColor.grey2,
          ),
          Text(
            textbuttom,
            style: TextStyle(
                color: activecolor == true
                    ? AppColor.primaryColor
                    : AppColor.grey2),
          )
        ],
      ),
    );
  }
}
