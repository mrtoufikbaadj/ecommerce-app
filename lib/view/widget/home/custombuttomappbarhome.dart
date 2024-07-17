import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/homescreen_controller.dart';
import 'package:justappecommerce/view/widget/home/custombuttomappbar.dart';

class Custombuttomappbarhome extends StatelessWidget {
  const Custombuttomappbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : Custombuttomappbar(
                      onPressed: () {
                        controller.changePage(i);
                      },
                      textbuttom: controller.buttomappbar[i]['title'],
                      icondata: controller.buttomappbar[i]['icon'],
                      activecolor: controller.currentPage == i ? true : false,
                    );
            })
          ],
        ),
      ),
    );
  }
}
