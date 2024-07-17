import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/bindings/intialbinding.dart';
import 'package:justappecommerce/core/localization/changelocal.dart';
import 'package:justappecommerce/core/localization/translation.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/rootes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    localController controller = Get.put(localController());
    return GetMaterialApp(
      translations: MyTranslaton(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // home: const Language(),
      initialBinding: IntialBinding(),
      //Test(),

      // routes: routes,
      getPages: routes,
    );
  }
}
