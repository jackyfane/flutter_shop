class FloorName {
  String floor1;
  String floor2;
  String floor3;

  FloorName({this.floor1, this.floor2, this.floor3});

  FloorName.fromJson(Map<String, dynamic> json) {
    floor1 = json['floor1'];
    floor2 = json['floor2'];
    floor3 = json['floor3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor1'] = this.floor1;
    data['floor2'] = this.floor2;
    data['floor3'] = this.floor3;
    return data;
  }
}