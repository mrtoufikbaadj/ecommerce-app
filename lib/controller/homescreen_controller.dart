import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/view/screen/home.dart';
import 'package:justappecommerce/view/screen/notification.dart';
import 'package:justappecommerce/view/screen/offers.dart';
import 'package:justappecommerce/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationView(),
    const OffersView(),
    const Settings(),
    // const Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("Settings"))],
    // ),
  ];

  List buttomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notification", "icon": Icons.notifications_active_outlined},
    {"title": "Offers", "icon": Icons.offline_bolt_outlined},
    {"title": "Settings", "icon": Icons.settings},
  ];

  List iconbuttomappbar = [
    Icons.home,
    Icons.person,
    Icons.favorite,
    Icons.settings
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
