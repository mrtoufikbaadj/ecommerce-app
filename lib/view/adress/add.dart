import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:justappecommerce/controller/adress/add_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';

class AdressAdd extends StatelessWidget {
  const AdressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAdressController controllerpage = Get.put(AddAdressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Adress'),
      ),
      body: Container(
          child: GetBuilder<AddAdressController>(
        builder: (controllerpage) => Handlingdataview(
          statusRequest: controllerpage.statusRequest,
          widget: Column(
            children: [
              if (controllerpage.kGooglePlex != null)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controllerpage.markers.toSet(),
                        onTap: (latLong) {
                          controllerpage.addMarkers(latLong);
                        },
                        initialCameraPosition: controllerpage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controllerpage.completecontroller!
                              .complete(controllermap);
                        },
                      ),
                      Positioned(
                          bottom: 10,
                          child: Container(
                              child: MaterialButton(
                            minWidth: 170,
                            color: AppColor.primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              controllerpage.goToPageAddDetailsAdress();
                            },
                            child: const Text(
                              "اكمال العنوان",
                              style: TextStyle(fontSize: 18),
                            ),
                          )))
                    ],
                  ),
                )
            ],
          ),
        ),
      )),
    );
  }
}
