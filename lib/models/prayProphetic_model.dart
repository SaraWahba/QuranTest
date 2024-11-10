class PrayPropheticModel {
  int? number;
  String? text;
  String? dicer;

  PrayPropheticModel({this.number, this.text, this.dicer});

  PrayPropheticModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    dicer = json['dicer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['text'] = this.text;
    data['dicer'] = this.dicer;
    return data;
  }
}
