class CartModel {
  num? itemspricewithdiscount;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemitemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? cartitemsprice;

  CartModel(
      {this.itemspricewithdiscount,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemitemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.cartitemsprice});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemspricewithdiscount = json["itemsprice"];
    countitems = json["countitems"];
    cartId = json["cart_id"];
    cartUsersid = json["cart_usersid"];
    cartItemsid = json["cart_itemsid"];
    itemsId = json["items_id"];
    cartitemsprice = json["cartitemsprice"];
    itemsName = json["items_name"];
    itemsNameAr = json["items_name_ar"];
    itemsDesc = json["items_desc"];
    itemitemsDescAr = json["itemitems_desc_ar"];
    itemsImage = json["items_image"];
    itemsCount = json["items_count"];
    itemsActive = json["items_active"];
    itemsPrice = json["items_price"];
    itemsDiscount = json["items_discount"];
    itemsDate = json["items_date"];
    itemsCat = json["items_cat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["itemsprice"] = itemspricewithdiscount;
    _data["countitems"] = countitems;
    _data["cart_id"] = cartId;
    _data["cart_usersid"] = cartUsersid;
    _data["cart_itemsid"] = cartItemsid;
    _data["items_id"] = itemsId;
    _data["cart_items_price"] = cartitemsprice;
    _data["items_name"] = itemsName;
    _data["items_name_ar"] = itemsNameAr;
    _data["items_desc"] = itemsDesc;
    _data["itemitems_desc_ar"] = itemitemsDescAr;
    _data["items_image"] = itemsImage;
    _data["items_count"] = itemsCount;
    _data["items_active"] = itemsActive;
    _data["items_price"] = itemsPrice;
    _data["items_discount"] = itemsDiscount;
    _data["items_date"] = itemsDate;
    _data["items_cat"] = itemsCat;

    return _data;
  }
}
