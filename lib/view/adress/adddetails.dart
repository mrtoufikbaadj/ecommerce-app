import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/adress/adddetails_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/shared/custombutton.dart';
import 'package:justappecommerce/view/widget/auth/customtextformauth.dart';

class AddAdressDetails extends StatelessWidget {
  const AddAdressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAdressDetailsController controller =
        Get.put(AddAdressDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add details adress'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<AddAdressDetailsController>(
              builder: (controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Customtextformauth(
                        hintText: 'City',
                        labelText: 'City',
                        iconData: Icons.location_city,
                        myController: controller.city,
                        valid: (val) {},
                        isNumber: false),
                    Customtextformauth(
                        hintText: 'Street',
                        labelText: 'Street',
                        iconData: Icons.streetview,
                        myController: controller.street,
                        valid: (val) {},
                        isNumber: false),
                    Customtextformauth(
                        hintText: 'name',
                        labelText: 'name',
                        iconData: Icons.near_me,
                        myController: controller.name,
                        valid: (val) {},
                        isNumber: false),
                    Custombutton(
                      text: 'Add',
                      onPressed: () {
                        controller.addAdress();
                      },
                    )
                  ],
                ),
              ),
            )));
  }
}
