import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/home_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/translatdatabase.dart';
import 'package:justappecommerce/data/model/categoriesmodel.dart';
import 'package:justappecommerce/linkapi.dart';

class Listcategories extends GetView<HomeControllerImp> {
  const Listcategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,
            categoriesModel.categoriesId!.toString());
      },
      child: Column(children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          width: 100,
          child: SvgPicture.network(
              "${Applink.imagescategories}/${categoriesModel.categoriesImage}"),
        ),
        Text(
          "${translatdatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
          style: const TextStyle(fontSize: 15, color: AppColor.black),
        ),
      ]),
    );
  }
}
