class Applink {
  //static const String server = "http://localhost:121/ecommerce";
  //static const String server = "http://localhost/ecommerce";
  static const String server = "http://192.168.1.2:121/ecommerce";

  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";

  //===============Images=========================

  static const String imagesstatic = "$server/upload";
  static const String imagescategories = "$imagesstatic/categories";
  static const String imagesitems = "$imagesstatic/items";

  //===============Auth=========================

  static const String signup = "$server/auth/signup.php";
  static const String verifycodesignup = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";
  static const String resend = "$server/auth/resend.php";

  //===============Forgetpassword=========================

  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String ressetpassword =
      "$server/forgetpassword/ressetpassword.php";

  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  //===============Home=========================

  static const String homepage = "$server/home.php";

  //===============Items=========================

  static const String itemspage = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

  //===============Favorite=========================

  static const String favoriteAdd = "$server/favorite/add.php";

  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

  //===============Cart=========================

  static const String cartview = "$server/cart/view.php";

  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  //===============Adress=========================

  static const String adressview = "$server/adress/view.php";

  static const String adressadd = "$server/adress/add.php";

  static const String adressedit = "$server/adress/edit.php";

  static const String adressdelete = "$server/adress/delete.php";

  //===============Coupon=========================

  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //===============orders=========================

  static const String checkout = "$server/orders/checkout.php";

  static const String pendingorders = "$server/orders/pending.php";

  static const String ordersarchive = "$server/orders/archive.php";

  static const String ordersdetails = "$server/orders/details.php";

  static const String orderdelete = "$server/orders/delete.php";

  //===============offers=========================

  static const String offers = "$server/offers.php";

  //===============rating=========================

  static const String rating = "$server/rating.php";
}
