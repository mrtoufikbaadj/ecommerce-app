import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/middleware/mymiddleware.dart';
import 'package:justappecommerce/view/adress/add.dart';
import 'package:justappecommerce/view/adress/adddetails.dart';
import 'package:justappecommerce/view/adress/edite.dart';
import 'package:justappecommerce/view/adress/view.dart';
import 'package:justappecommerce/view/screen/auth/Successsignup.dart';
import 'package:justappecommerce/view/screen/auth/forgotpassword/forgotpassword.dart';
import 'package:justappecommerce/view/screen/auth/login.dart';
import 'package:justappecommerce/view/screen/auth/forgotpassword/resetpassword.dart';
import 'package:justappecommerce/view/screen/auth/signup.dart';
import 'package:justappecommerce/view/screen/auth/forgotpassword/successresetpassword.dart';
import 'package:justappecommerce/view/screen/auth/forgotpassword/verifycode.dart';
import 'package:justappecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:justappecommerce/view/screen/cart.dart';
import 'package:justappecommerce/view/screen/checkout.dart';
import 'package:justappecommerce/view/screen/homescreen.dart';
import 'package:justappecommerce/view/screen/itemspage.dart';
import 'package:justappecommerce/view/screen/language.dart';
import 'package:justappecommerce/view/screen/myfavorite.dart';
import 'package:justappecommerce/view/screen/onboarding.dart';
import 'package:justappecommerce/view/screen/orders/archive.dart';
import 'package:justappecommerce/view/screen/orders/details.dart';
import 'package:justappecommerce/view/screen/orders/pending.dart';
import 'package:justappecommerce/view/screen/productdetails.dart';
import 'package:justappecommerce/view/widget/orders/orderstracking.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),

  GetPage(name: AppRout.cart, page: () => const Cart()),

  //Auth

  GetPage(name: AppRout.login, page: () => const Login()),
  GetPage(name: AppRout.signup, page: () => SignUp()),
  GetPage(name: AppRout.forgotpassword, page: () => const ForgotPassword()),
  GetPage(name: AppRout.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRout.ressetpassword, page: () => const RessetPassword()),
  GetPage(name: AppRout.successsignup, page: () => const Successsignup()),
  GetPage(
      name: AppRout.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRout.verifycodesignup, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRout.onBoarding, page: () => const OnBoarding()),

  //Home page

  GetPage(name: AppRout.homepage, page: () => const Homescreen()),
  GetPage(name: AppRout.itemspage, page: () => const Items()),
  GetPage(name: AppRout.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRout.myfavorite, page: () => const MyFavorite()),

  //Home page

  GetPage(name: AppRout.adressview, page: () => const AdressView()),
  GetPage(name: AppRout.adressadd, page: () => const AdressAdd()),
  GetPage(name: AppRout.addadressdetails, page: () => const AddAdressDetails()),
  GetPage(name: AppRout.adressedite, page: () => const AdressEdite()),

  // checkout
  GetPage(name: AppRout.checkout, page: () => const CheckOut()),
  // orders
  GetPage(name: AppRout.pendingorders, page: () => const PendingOrders()),

  GetPage(name: AppRout.archiveOders, page: () => const ArchiveOdersView()),
  GetPage(name: AppRout.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRout.orderstracking, page: () => const OrdersTracking()),

  // offers
  //GetPage(name: AppRout.offers, page: () => const OffersView()),
];
