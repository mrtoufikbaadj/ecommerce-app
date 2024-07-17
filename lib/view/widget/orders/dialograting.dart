import 'package:get/get.dart';
import 'package:justappecommerce/controller/orders/archive_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/imageasset.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';

// show the dialog
void showDialoRating(BuildContext context, String orderid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(
        AppImageAsset.logo,
        height: 200,
        width: 200,
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle:
          TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrdersController controller = Get.find();
        // print('rating: ${response.rating}, comment: ${response.comment}');
        controller.submitRating(orderid, response.rating, response.comment);
      },
    ),
  );
}
