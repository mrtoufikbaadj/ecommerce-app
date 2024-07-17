import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/items_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/translatdatabase.dart';
import 'package:justappecommerce/data/model/categoriesmodel.dart';

class ListcategoriesItems extends GetView<ItemsControllerImp> {
  const ListcategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return SizedBox(
      height: 130,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.categoriesId!.toString());
      },
      child: Column(children: [
        GetBuilder<ItemsControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 15),
            decoration: controller.selectedCat == i
                ? const BoxDecoration(
                    border: Border(
                    bottom: BorderSide(width: 3, color: AppColor.primaryColor),
                  ))
                : null,
            child: Text(
              "${translatdatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
              style: const TextStyle(fontSize: 15, color: AppColor.black),
            ),
          ),
        )
      ]),
    );
  }
}
