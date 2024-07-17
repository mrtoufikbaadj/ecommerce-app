import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/imageasset.dart';
import 'package:justappecommerce/linkapi.dart';

class CustomtemsICardList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomtemsICardList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  //color: AppColor.primaryColor,
                  child: CachedNetworkImage(
                    imageUrl: "${Applink.imagesitems}/${imagename}",
                    height: 80,
                  ),
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(name),
                  subtitle: Text(
                    price,
                    style: const TextStyle(
                        fontFamily: "sans",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColor.primaryColor),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                    height: 40,
                    child: IconButton(
                        onPressed: onAdd, icon: const Icon(Icons.add))),
                Container(
                  height: 20,
                  child: Text(
                    count,
                    style: const TextStyle(
                        fontFamily: "sans",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor),
                  ),
                ),
                Container(
                  height: 30,
                  child: IconButton(
                      onPressed: onRemove, icon: const Icon(Icons.remove)),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
