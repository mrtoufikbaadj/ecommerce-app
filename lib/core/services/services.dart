import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey:
            "AiD4jo8rTJBsmyb_H9S7EGZmTgVjGM7Gez-iRWKgglg", // paste your api key here
        appId:
            "1:911183863938:android:92ea1d3b57c93e7128549b", //paste your app id here
        messagingSenderId: "911183863938", //paste your messagingSenderId here
        projectId: "ecommerce-43db7", //paste your project id here
      ),
    );

    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
