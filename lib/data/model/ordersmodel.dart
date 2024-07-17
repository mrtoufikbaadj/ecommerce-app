class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAdress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  num? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersNoterating;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersDatetime;
  int? adressId;
  int? adressUsersid;
  String? adressName;
  String? adressCity;
  String? adressStreet;
  num? adressLat;
  num? adressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAdress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersNoterating,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersDatetime,
      this.adressId,
      this.adressUsersid,
      this.adressName,
      this.adressCity,
      this.adressStreet,
      this.adressLat,
      this.adressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json["orders_id"];
    ordersUsersid = json["orders_usersid"];
    ordersAdress = json["orders_adress"];
    ordersType = json["orders_type"];
    ordersPricedelivery = json["orders_pricedelivery"];
    ordersPrice = json["orders_price"];
    ordersTotalprice = json["orders_totalprice"];
    ordersCoupon = json["orders_coupon"];
    ordersRating = json["orders_rating"];
    ordersNoterating = json["orders_noterating"];
    ordersPaymentmethod = json["orders_paymentmethod"];
    ordersStatus = json["orders_status"];
    ordersDatetime = json["orders_datetime"];
    adressId = json["adress_id"];
    adressUsersid = json["adress_usersid"];
    adressName = json["adress_name"];
    adressCity = json["adress_city"];
    adressStreet = json["adress_street"];
    adressLat = json["adress_lat"];
    adressLong = json["adress_long"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["orders_id"] = ordersId;
    _data["orders_usersid"] = ordersUsersid;
    _data["orders_adress"] = ordersAdress;
    _data["orders_type"] = ordersType;
    _data["orders_pricedelivery"] = ordersPricedelivery;
    _data["orders_price"] = ordersPrice;
    _data["orders_totalprice"] = ordersTotalprice;
    _data["orders_coupon"] = ordersCoupon;
    _data["orders_rating"] = ordersRating;
    _data["orders_noterating"] = ordersNoterating;
    _data["orders_paymentmethod"] = ordersPaymentmethod;
    _data["orders_status"] = ordersStatus;
    _data["orders_datetime"] = ordersDatetime;
    _data["adress_id"] = adressId;
    _data["adress_usersid"] = adressUsersid;
    _data["adress_name"] = adressName;
    _data["adress_city"] = adressCity;
    _data["adress_street"] = adressStreet;
    _data["adress_lat"] = adressLat;
    _data["adress_long"] = adressLong;
    return _data;
  }
}
