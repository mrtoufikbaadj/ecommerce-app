class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  int? couponDiscount;
  String? couponExpiredate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpiredate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json["coupon_id"];
    couponName = json["coupon_name"];
    couponCount = json["coupon_count"];
    couponDiscount = json["coupon_discount"];
    couponExpiredate = json["coupon_expiredate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["coupon_id"] = couponId;
    _data["coupon_name"] = couponName;
    _data["coupon_count"] = couponCount;
    _data["coupon_discount"] = couponDiscount;
    _data["coupon_expiredate"] = couponExpiredate;
    return _data;
  }
}
