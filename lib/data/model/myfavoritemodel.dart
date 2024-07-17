class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
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
  int? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
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
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json["favorite_id"];
    favoriteUsersid = json["favorite_usersid"];
    favoriteItemsid = json["favorite_itemsid"];
    itemsId = json["items_id"];
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
    usersId = json["users_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["favorite_id"] = favoriteId;
    _data["favorite_usersid"] = favoriteUsersid;
    _data["favorite_itemsid"] = favoriteItemsid;
    _data["items_id"] = itemsId;
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
    _data["users_id"] = usersId;
    return _data;
  }
}
