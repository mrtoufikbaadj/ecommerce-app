import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/settings_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/imageasset.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());

    return Container(
        child: ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.width / 3,
              color: AppColor.primaryColor,
            ),
            Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(255, 240, 237, 237),
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              children: [
                // ListTile(
                //   onTap: () {},
                //   title: const Text("Disable notification"),
                //   trailing: Switch(value: true, onChanged: (val) {}),
                // ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRout.pendingorders);
                  },
                  title: const Text("Pending Orders"),
                  trailing: const Icon(Icons.local_shipping_outlined),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRout.archiveOders);
                  },
                  title: const Text("Archive Orders"),
                  trailing: const Icon(Icons.local_shipping),
                ),
                // const Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRout.adressview);
                  },
                  title: const Text("Adress"),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                // const Divider(),
                ListTile(
                  onTap: () {},
                  title: const Text("About us"),
                  trailing: const Icon(Icons.help_outline_rounded),
                ),
                // const Divider(),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:0669766465"));
                  },
                  title: const Text("Contact us"),
                  trailing: const Icon(Icons.phone_callback_rounded),
                ),
                // const Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
