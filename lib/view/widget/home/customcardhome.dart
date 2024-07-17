import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/home_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Customcardhome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const Customcardhome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                subtitle: Text(
                  body,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              )),
          Positioned(
            top: -35,
            right: controller.lang == "en" ? -35 : null,
            left: controller.lang == "ar" ? -35 : null,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)),
              child: const Center(
                child: Text(
                  "20%",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
