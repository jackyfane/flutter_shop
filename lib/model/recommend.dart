class Recommend {
  String goodsId;
  String goodsName;
  String image;
  double mallPrice;
  double price;

  Recommend(
      {this.goodsId, this.goodsName, this.image, this.mallPrice, this.price});

  Recommend.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    image = json['image'];
    mallPrice = json['mallPrice'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['price'] = this.price;
    return data;
  }
}