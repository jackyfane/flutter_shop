class Floor {
  Null goodsId;
  String image;

  Floor({this.goodsId, this.image});

  Floor.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['image'] = this.image;
    return data;
  }
}
