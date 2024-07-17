import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:justappecommerce/controller/adress/adressview_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/data/model/adressmodel.dart';

class AdressView extends StatelessWidget {
  const AdressView({super.key});

  @override
  Widget build(BuildContext context) {
    AdreeViewController controller = Get.put(AdreeViewController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adress'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRout.adressadd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<AdreeViewController>(
          builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CardAdress(
                      adressModel: controller.data[index],
                      onDelete: () {
                        controller.deleteAdress(
                            controller.data[index].adressId.toString());
                      },
                    );
                  },
                ),
              )),
        ));
  }
}

class CardAdress extends StatelessWidget {
  final AdressModel adressModel;
  final void Function()? onDelete;
  const CardAdress(
      {super.key, required this.adressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text("${adressModel.adressName}"),
            subtitle:
                Text("${adressModel.adressStreet} ${adressModel.adressCity}"),
            trailing: IconButton(
                onPressed: onDelete, icon: Icon(Icons.delete_outline)),
          )),
    );
  }
}
