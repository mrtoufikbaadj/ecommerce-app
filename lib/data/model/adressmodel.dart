class AdressModel {
  int? adressId;
  int? adressUsersid;
  String? adressName;
  String? adressCity;
  String? adressStreet;
  num? adressLat;
  num? adressLong;

  AdressModel(
      {this.adressId,
      this.adressUsersid,
      this.adressName,
      this.adressCity,
      this.adressStreet,
      this.adressLat,
      this.adressLong});

  AdressModel.fromJson(Map<String, dynamic> json) {
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
