class Slides {
  String goodsId;
  String image;
  int urlType;

  Slides({this.goodsId, this.image, this.urlType});

  Slides.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    image = json['image'];
    urlType = json['urlType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['image'] = this.image;
    data['urlType'] = this.urlType;
    return data;
  }
}