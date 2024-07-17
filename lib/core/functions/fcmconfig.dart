import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/orders/pending_controller.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen(
    (message) {
      print("==============Notification=================");
      print(message.notification!.title);
      print(message.notification!.body);
      FlutterRingtonePlayer().playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      refrechPageNotification(message.data);
    },
  );
}

refrechPageNotification(data) {
  print("===============pageid=======================");
  print(data['pageid']);
  print("===============pagename=======================");
  print(data['pagename']);
  print("===============Current Route=======================");
  print(Get.currentRoute);
  if (Get.currentRoute == "/pendingorders" &&
      data['pagename'] == "refrechPendingOrders") {
    print("===============refrech order=======================");
    PendingOrdersController controller = Get.find();
    controller.refrechOrder();
  }
}
