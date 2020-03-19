class CartInfo {
  String goodsId;
  String goodsName;
  String imageAddress;
  double price;
  int count;
  bool isChecked;

  CartInfo({
    this.goodsId,
    this.goodsName,
    this.imageAddress,
    this.price,
    this.count,
    this.isChecked,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['imageAddress'] = this.imageAddress;
    data['price'] = this.price;
    data['count'] = this.count;
    data['isChecked'] = this.isChecked;
    return data;
  }

  CartInfo.fromJson(Map<String, dynamic> json) {
    this.goodsId = json['goodsId'];
    this.goodsName = json['goodsName'];
    this.imageAddress = json['imageAddress'];
    this.price = json['price'];
    this.count = json['count'];
    this.isChecked = json['isChecked'];
  }
}
