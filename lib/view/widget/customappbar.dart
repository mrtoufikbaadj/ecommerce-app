import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Customappbar extends StatelessWidget {
  final String titleappbar;
  //final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;

  const Customappbar(
      {super.key,
      required this.titleappbar,
      // this.onPressedIcon,
      this.onPressedSearch,
      required this.onPressedIconFavorite,
      this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefix: IconButton(
                  onPressed: onPressedSearch,
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                hintText: titleappbar,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 224, 223, 223),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 224, 223, 223),
              ),
              //padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: const Icon(Icons.favorite_border_outlined),
              )),
        ],
      ),
    );
  }
}
