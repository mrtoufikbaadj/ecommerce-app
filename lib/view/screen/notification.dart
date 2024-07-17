import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:justappecommerce/controller/notification_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return GetBuilder<NotificationController>(
      builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                const Center(
                    child: Text(
                  "Notification",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(
                  controller.data.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Stack(
                      children: [
                        ListTile(
                          title: Text(
                              controller.data[index]['notification_title']),
                          subtitle:
                              Text(controller.data[index]['notification_body']),
                        ),
                        Positioned(
                            right: 5,
                            child: Text(
                              Jiffy.parse(controller.data[index]
                                      ['notification_datetime'])
                                  .fromNow(),
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
