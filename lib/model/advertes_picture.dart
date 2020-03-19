class AdvertesPicture {
  String pICTUREADDRESS;
  String tOPLACE;
  int urlType;

  AdvertesPicture({this.pICTUREADDRESS, this.tOPLACE, this.urlType});

  AdvertesPicture.fromJson(Map<String, dynamic> json) {
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
    tOPLACE = json['TO_PLACE'];
    urlType = json['urlType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    data['TO_PLACE'] = this.tOPLACE;
    data['urlType'] = this.urlType;
    return data;
  }
}